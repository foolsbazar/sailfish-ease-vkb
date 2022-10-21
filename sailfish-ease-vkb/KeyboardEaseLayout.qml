// Copyright (C) 2013 Jolla Ltd.
// Contact: Pekka Vuorela <pekka.vuorela@jollamobile.com>

import QtQuick 2.0
import com.meego.maliitquick 1.0
import Sailfish.Silica 1.0
import com.jolla.keyboard 1.0
import org.nemomobile.configuration 1.0
import org.nemomobile.systemsettings 1.0
import "../touchpointarray.js" as ActivePoints2
import ".."

KeyboardLayout {
    id: keyboardLayout

    property bool isLandscape
    property bool isEase: true
    property var accentMap: ({})
    property string lastAccentMerge: ""
    property string lastCommited: ""

    Component.onCompleted: {
        if (!componentSearchCompleted)
            searchParentsChild()
    }
    onPortraitModeChanged: {
        cancelAllTouchPoints()
    }
    onVisibleChanged: if (!componentSearchCompleted) searchParentsChild()

    ConfigurationValue {
        id: useMouseEvents
        key: "/sailfish/text_input/use_mouse_events"
        defaultValue: false
    }

    property Item languageSelectionItem
    property Item childToBeDisabled
    property bool componentSearchCompleted: false
    function searchParentsChild(){
     console.info(keyboard)
        // Hack to find child MultiPointTouchArea of KeybardBase{}
        var multiPointTouchArea_idx = -1
        var languageSelectionPopup_idx = -1
        for (var i=0; i<keyboard.children.length; ++i){

         // seaching for the child 'MultiPointTouchArea' by looking at all the properties a MultiPointTouchArea has
         if ( (keyboard.children[i].maximumTouchPoints !== undefined) && (keyboard.children[i].minimumTouchPoints !== undefined) &&
                    (keyboard.children[i].mouseEnabled !== undefined) && (keyboard.children[i].touchPoints !== undefined)) {
                    console.info(keyboard.children[i])
             multiPointTouchArea_idx = i;
                    }
         // seaching for the child 'LanguageSelectionPopup'
         if ( (keyboard.children[i].activeCell !== undefined) && (keyboard.children[i].inInitialPosition !== undefined) &&
                    (keyboard.children[i].pointId !== undefined) && (keyboard.children[i].opening !== undefined))
             languageSelectionPopup_idx = i;
        }
        if (languageSelectionPopup_idx !== -1) languageSelectionItem = keyboard.children[languageSelectionPopup_idx]
        if (multiPointTouchArea_idx !== -1) childToBeDisabled = keyboard.children[multiPointTouchArea_idx]
        if (multiPointTouchArea_idx !== -1 && languageSelectionPopup_idx !== -1){
            componentSearchCompleted = true
            console.info(childToBeDisabled)
            console.info(languageSelectionItem)
            console.info('Conponents research executed')
        }
        
    }
    states: State {
        name: "disableOriginalTouchpointArea"
        when: componentSearchCompleted && keyboardLayout.visible
        PropertyChanges {
            target: childToBeDisabled
            enabled: keyboard.layout.isEase === undefined
        }
        PropertyChanges {
            target: keyboard
            interactive: keyboard.layout.isEase === undefined
        }
    }
    Timer {
        id: pressTimer
        interval: 500
    }

    Timer {
        id: releaseTimer
        interval: 300
    }

    Timer {
        id: languageSwitchTimer
        interval: 500
        onTriggered: {
            if (canvas.layoutModel.enabledCount > 1) {
                var point = ActivePoints2.findByKeyId(Qt.Key_Space)
                languageSelectionItem.show(point)
            }
        }
    }
    QuickPick {
        id: quickPick
    }
    MultiPointTouchArea {
        id:personalMultiPointTouchArea
        parent: keyboardLayout.parent
        z: keyboardLayout.z + 1
        anchors.fill: parent
        enabled: keyboardLayout.visible && !useMouseEvents.value && keyboardLayout.componentSearchCompleted

        onPressed: keyboardLayout._handlePressed(touchPoints)
        onUpdated: keyboardLayout._handleUpdated(touchPoints)
        onReleased: keyboardLayout._handleReleased(touchPoints)
        onCanceled: keyboardLayout._handleCanceled(touchPoints)

    }
    function _handlePressed(touchPoints) {

        if (languageSelectionItem.visible) {
            return
        }

        keyboard.closeSwipeActive = true
        keyboard.silenceFeedback = false
        pressTimer.start()

        for (var i = 0; i < touchPoints.length; i++) {
            var point = ActivePoints2.addPoint(touchPoints[i])
            _updatePressedKey(point)
        }
    }

    function _handleUpdated(touchPoints) {
        if (languageSelectionItem.visible) {
            languageSelectionItem.handleMove(touchPoints[0])
            return
        }

        for (var i = 0; i < touchPoints.length; i++) {
            var incomingPoint = touchPoints[i]
            var point = ActivePoints2.findById(incomingPoint.pointId)
            if (point === null)
                continue

            point.x = incomingPoint.x
            point.y = incomingPoint.y

            var key = keyAt(point.startX, point.startY)
            if (ActivePoints2.array.length === 1 && keyboard.closeSwipeActive && pressTimer.running &&
                    (key === null || key.tempPoint === undefined)) {
                var yDiff = point.y - point.startY
                keyboard.silenceFeedback = (yDiff > Math.abs(point.x - point.startX))

                if (yDiff > keyboard.closeSwipeThreshold) {
                    // swiped down to close keyboard
                    MInputMethodQuick.userHide()
                    if (point.pressedKey) {
                        keyboard.inputHandler._handleKeyRelease()
                        point.pressedKey.pressed = false
                    }
                    keyboard.lastPressedKey = null
                    pressTimer.stop()
                    languageSwitchTimer.stop()
                    ActivePoints2.remove(point)
                    return
                }
            } else {
                keyboard.silenceFeedback = false
            }

            if (!keyboard.gestureInProgress && !keyboard.transitionRunning) {

                if (key !== null && key.tempPoint !== undefined) {
                    key.currentPoint = Qt.point(point.x - (point.startX - key.startPoint.x) , point.y - (point.startY - key.startPoint.y))

                    var distX = point.x - point.startX
                    var distY = point.y - point.startY
                    if (Math.abs(distX) < key.height * 0.5 && Math.abs(distY) < key.height * 0.5) {
                        key.swipeValue = -1
                    } else if (Math.abs(distX) > 3 * Math.abs(distY)){
                        if (distX < 0) {
                            if (Math.abs(distX) > key.height * 2.1) { // Special case of really long swipe
                                key.swipeValue = -20 // SpecialValue : backSpace
                            } else {
                                key.swipeValue = 3
                            }
                        } else {
                            if (Math.abs(distX) > key.height * 2.1) { // Special case of really long swipe
                                key.swipeValue = -10 // SpecialValue : space
                            } else {
                                key.swipeValue = 4
                            }

                        }
                    } else if (Math.abs(distY) > 3 * Math.abs(distX)){
                        if (distY < 0) {
                            key.swipeValue = 1
                        } else {
                            key.swipeValue = 6
                        }
                    } else if (distY < 0 && distX < 0) {
                        key.swipeValue = 0
                    } else if (distY < 0 && distX > 0) {
                        key.swipeValue = 2
                    } else if (distY > 0 && distX < 0) {
                        key.swipeValue = 5
                    } else if (distY > 0 && distX > 0) {
                        key.swipeValue = 7
                    } else {
                        key.swipeValue = -1
                    }

                }
            }
        }
    }

    function _updatePressedKey(point) {
        var key = keyAt(point.x, point.y)
        if (key !== null && key.tempPoint !== undefined) {
            key.startPoint = key.tempPoint
            key.currentPoint = key.tempPoint
        }
        if (point.pressedKey === key)
            return

        if (!keyboard.silenceFeedback) buttonPressEffect.play()

        if (key && !keyboard.silenceFeedback) {
            if (key.keyType !== undefined && key.keyType === KeyType.CharacterKey && key.text !== " ") {
                SampleCache.play("/usr/share/sounds/jolla-ambient/stereo/keyboard_letter.wav")
            } else {
                SampleCache.play("/usr/share/sounds/jolla-ambient/stereo/keyboard_option.wav")
            }
        }

        if (point.pressedKey !== null) {
            keyboard.inputHandler._handleKeyRelease()
            point.pressedKey.pressed = false
        }

        point.pressedKey = key
        if (!point.initialKey) {
            point.initialKey = point.pressedKey
            keyboard.lastInitialKey = point.initialKey
        }

        languageSwitchTimer.stop()
        keyboard.lastPressedKey = point.pressedKey
        if (point.pressedKey !== null) {
            // when typing fast with two finger, one finger might be still pressed when the other hits screen.
            // on that case, trigger input from previous character
            releasePreviousCharacterKey(point)
            //console.info("before")
            point.pressedKey.pressed = true
//            console.info("after")
//            console.info(childToBeDisabled.enabled)
//            console.info(personalMultiPointTouchArea.enabled)
//            console.info(ActivePoints2.array)
            keyboard.inputHandler._handleKeyPress(point.pressedKey)
            if (point.pressedKey.key === Qt.Key_Space && keyboard.layoutChangeAllowed)
                languageSwitchTimer.start()
        }
    }

    function _handleReleased(touchPoints) {
        releaseTimer.restart()

        if (languageSelectionItem.visible) {
            if (languageSelectionItem.opening) {
                languageSelectionItem.hide()
            } else {
                cancelAllTouchPoints()
                languageSelectionItem.hide()
                canvas.switchLayout(languageSelectionItem.activeCell)
                if (keyboard.layout !== keyboardLayout) return
            }
        }

        for (var i = 0; i < touchPoints.length; i++) {
            var point = ActivePoints2.findById(touchPoints[i].pointId)
            if (point === null)
                continue

            if (point.pressedKey === null) {
                ActivePoints2.remove(point)
                continue
            }

            if (point.pressedKey.swipeValue !== undefined && point.pressedKey.swipeValue === -10) {
                inputKey.text = " "
                inputKey.key = Qt.Key_Space
                keyboard.inputHandler._handleKeyClick(inputKey)
                inputKey.key = Qt.Key_unknown
                keyboard.inputHandler._handleKeyRelease()
                point.pressedKey.pressed = false
            } else if (point.pressedKey.swipeValue !== undefined && point.pressedKey.swipeValue === -20) {
                keyboard.inputHandler._handleKeyClick(dummyBackspace)
                keyboard.inputHandler._handleKeyRelease()
                point.pressedKey.pressed = false
            } else {
                triggerKey(point.pressedKey)
            }


            if (point.pressedKey.keyType !== KeyType.ShiftKey && !isPressed(KeyType.DeadKey)) {
                keyboard.deadKeyAccent = ""
            }
            if (point.pressedKey === keyboard.lastPressedKey) {
                keyboard.lastPressedKey = null
            }

            ActivePoints2.remove(point)
        }

        if (ActivePoints2.array.length === 0) {
            keyboard.characterKeyCounter = 0
        }
        languageSwitchTimer.stop()
    }

    function _handleCanceled(touchPoints) {
        for (var i = 0; i < touchPoints.length; i++) {
            keyboard.cancelTouchPoint(touchPoints[i].pointId)
        }
    }

    function cancelAllTouchPoints() {
        while (ActivePoints2.array.length > 0) {
            cancelTouchPoint(ActivePoints2.array[0].pointId)
        }
        keyboard.cancelAllTouchPoints()
    }

    function cancelTouchPoint(pointId) {
        var point = ActivePoints2.findById(pointId)
        if (!point)
            return

        if (point.pressedKey) {
            keyboard.inputHandler._handleKeyRelease()
            point.pressedKey.pressed = false
            if (keyboard.lastPressedKey === point.pressedKey) {
                keyboard.lastPressedKey = null
            }
        }
        if (keyboard.lastInitialKey === point.initialKey) {
            keyboard.lastInitialKey = null
        }

        languageSwitchTimer.stop()
        languageSelectionItem.hide()

        ActivePoints2.remove(point)
    }

    function keyAt(x, y) {
        if (layout === null)
            return null

        var item = keyboardLayout

        x -= keyboardLayout.x
        y -= keyboardLayout.y

        while ((item = item.childAt(x, y)) != null) {
            if (item.keyType !== undefined && item.enabled === true) {
                if (item.tempPoint !== undefined) {
                    item.tempPoint = Qt.point(x - item.x, y - item.y)
                }
                return item
            }

            // Cheaper mapToItem, assuming we're not using anything fancy.
            x -= item.x
            y -= item.y
        }

        return null
    }
    function existingCharacterKey(ignoredPoint) {
        for (var i = 0; i < ActivePoints2.array.length; i++) {
            var point = ActivePoints2.array[i]
            if (point !== ignoredPoint
                    && point.pressedKey
                    && point.pressedKey.keyType === KeyType.CharacterKey) {
                return point
            }
        }
    }
    function releasePreviousCharacterKey(ignoredPoint) {
        var existing = existingCharacterKey(ignoredPoint)
        if (existing) {
            triggerKey(existing.pressedKey)
            ActivePoints2.remove(existing)
        }
    }

    function isPressed(keyType) {
        return ActivePoints2.findByKeyType(keyType) !== null
    }

    KeyBase {
        id: dummyBackspace
        key: Qt.Key_Backspace
        keyType:KeyType.FunctionKey
    }
    KeyBase {
        // using one element for updating input handler
        id: inputKey
        keyType: KeyType.PopupKey
    }
    function triggerKey(key) {
        if (!keyboard.gestureInProgress && !keyboard.transitionRunning) {
            if (key.keyType !== KeyType.DeadKey) {
                if (key.keyType === KeyType.CharacterKey && key.tempPoint !== undefined) {
                    inputKey.text=key.text
                    var previousChar
                    if (keyboard.inputHandler.preedit !== undefined && keyboard.inputHandler.preedit !== "")
                        previousChar = keyboard.inputHandler.preedit[keyboard.inputHandler.preedit.length -1]
                    else
                        previousChar = MInputMethodQuick.surroundingText.charAt(MInputMethodQuick.cursorPosition - 1)
                    var merge
                    if (previousChar in accentMap && inputKey.text in accentMap[previousChar]) {
                        merge = accentMap[previousChar][inputKey.text]
                        lastAccentMerge = previousChar //+ inputKey.text
                        keyboard.inputHandler._handleKeyClick(dummyBackspace)
                        inputKey.text = merge
                    } else if (previousChar === "" && lastCommited in accentMap && inputKey.text in accentMap[lastCommited]) {
                        merge = accentMap[lastCommited][inputKey.text]
                        lastAccentMerge = lastCommited //+ inputKey.text
                        keyboard.inputHandler._handleKeyClick(dummyBackspace)
                        inputKey.text = merge
                    } else {
                        lastCommited = inputKey.text
                        lastAccentMerge = ""
                    }
                    keyboard.inputHandler._handleKeyClick(inputKey)
                } else
                    keyboard.inputHandler._handleKeyClick(key)
            }

            if (layout.lastAccentMerge !== "") {
                if (key.key === Qt.Key_Backspace) {
                    inputKey.text = lastAccentMerge
                    keyboard.inputHandler._handleKeyClick(inputKey)
                    lastAccentMerge = ""
                } else if (key.key === Qt.Key_Return || key.key === Qt.Key_Space)
                    lastAccentMerge = ""
            }
            key.clicked()
            quickPick.handleInput(key)
        }
        keyboard.inputHandler._handleKeyRelease()
        key.pressed = false
        if (key.tempPoint !== undefined) {
            key.swipeValue = -1
            key.startPoint = Qt.point(0,0)
            key.currentPoint = Qt.point(0,0)
        }
    }
}
