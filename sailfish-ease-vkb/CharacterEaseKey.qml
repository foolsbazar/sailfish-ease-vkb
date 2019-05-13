/*
 * Copyright (C) 2011 Nokia Corporation and/or its subsidiary(-ies). All rights reserved.
 * Copyright (C) 2012-2013 Jolla Ltd.
 *
 * Contact: Pekka Vuorela <pekka.vuorela@jollamobile.com>
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice, this list
 * of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list
 * of conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 * Neither the name of Nokia Corporation nor the names of its contributors may be
 * used to endorse or promote products derived from this software without specific
 * prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 * OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 */

import QtQuick 2.0
import com.jolla.keyboard 1.0
import Sailfish.Silica 1.0
import ".."

KeyBase {

    id: aCharKey
    height: parent.height
    showPopper: false
    property var keyValue: {
                                "caption":        "",
                                "captionShifted": "",
                                "swipeCaption":        ["", "", "", "", "", "", "", ""],
                                "swipeCaptionShifted": ["", "", "", "", "", "", "", ""],
                                "swipeSpecial":        ["", "", "", "", "", "", "", ""],
                                "symView": ""
                            }

    caption: keyValue["caption"]
    property string captionShifted: keyValue["captionShifted"]
    property string symView: keyValue["symView"]
    property string symView2: caption
    property int separator: SeparatorState.AutomaticSeparator
    property bool implicitSeparator: true // set by layouting
    property bool showHighlight: true
    property string accents
    property string accentsShifted
    property string nativeAccents // accents considered native to the written language. not rendered.
    property string nativeAccentsShifted
    property bool fixedWidth
    property alias useBoldFont: textItem.font.bold
    property alias pixelSize: textItem.font.pixelSize
    property alias fontSizeMode: textItem.fontSizeMode
    property alias textAnchors: textItem.anchors

    property var swipeCaption: keyValue["swipeCaption"]
    property var swipeCaptionShifted: keyValue["swipeCaptionShifted"]
    property var swipeSpecial: keyValue["swipeSpecial"]
    property int swipeValue: -1
    property point tempPoint: Qt.point(0,0)
    property point startPoint:Qt.point(0,0)
    property point currentPoint:Qt.point(0,0)
    property bool swipeHighlightEnable: true

    property var swipeArray: attributes.isShifted ? swipeCaptionShifted : swipeCaption

    keyType: KeyType.CharacterKey
    text: keyText
    keyText: swipeValue >= 0 ? (swipeArray[swipeValue] === "" ? swipeSpecial[swipeValue] : swipeArray[swipeValue])
                             : (attributes.inSymView && symView.length > 0 ? symView
                                                                           : (attributes.isShifted ? captionShifted : caption))

    onPressedChanged: {
        if (!pressed) {
            swipeValue = -1
            startPoint = Qt.point(0,0)
            currentPoint = Qt.point(0,0)
        } else {
            keyboard.cancelGesture()
        }
    }

    Text {
        id: textItem
        anchors.centerIn: parent
        //anchors.margins: Math.min(parent.width, parent.height) * 0.1
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSizeExtraLarge
        color: pressed ? Theme.highlightColor : Theme.primaryColor
        text: aCharKey.keyText
    }

    Repeater {
        model: swipeArray
        delegate: Text {
            width: Math.min(parent.width, parent.height) * 0.5
            height: width
            anchors.centerIn: textItem
            anchors.verticalCenterOffset: index < 3 ? -aCharKey.height * 0.325
                                                    : index > 4 ? aCharKey.height * 0.325
                                                                : 0
            anchors.horizontalCenterOffset: index == 0 || index == 3 || index == 5 ? -aCharKey.width * 0.3
                                                    : index == 2 || index == 4 || index == 7 ? aCharKey.width * 0.3
                                                                : 0
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSizeSmall
            fontSizeMode: Text.Fit
            color: Theme.primaryColor
            text: modelData === "" ? swipeSpecial[index] : !attributes.inSymView ? modelData : ""
            opacity: modelData !== "" ? 0.8 : attributes.inSymView2 || attributes.inSymView  ? 0.5 : 0
        }
    }
//    Rectangle {
//        anchors.centerIn: parent
//        width: parent.width * 0.95
//        height: parent.height * 0.98
//        color: Theme.highlightBackgroundColor
//        radius: height/6
//        opacity: 0.1
//    }

    Rectangle {
        id: highlightCircle
        anchors.centerIn: parent
        width: Math.max(textItem.implicitWidth, textItem.implicitHeight)
        height: width
        radius: width / 2
        z: -1
        color: Theme.highlightBackgroundColor
        opacity: 0.5
        visible: pressed && showHighlight && swipeHighlightEnable
    }
    property alias spwipeTraceVisible:swipeTrace.visible
    Rectangle {
        id: swipeTrace
        x: highlightCircle.x + highlightCircle.radius
        y: highlightCircle.y + highlightCircle.radius - radius
        width: Math.sqrt(Math.pow(xDist, 2) + Math.pow(yDist, 2) )
        height: Math.max(textItem.implicitWidth, textItem.implicitHeight) * 0.4
        radius: height / 2
        z: -1
        color: Theme.highlightBackgroundColor
        opacity: 0.3
        visible: swipeHighlightEnable
        transformOrigin: Item.Left

        property real xDist: startPoint.x - currentPoint.x
        property real yDist: startPoint.y - currentPoint.y
        property real rotValue: Math.atan(Math.abs(yDist) / Math.abs(xDist)) * 180 / Math.PI
        rotation: xDist > 0 && yDist > 0 ? 180 + rotValue
                                         : xDist < 0 && yDist < 0 ? rotValue
                                                                  : xDist < 0 && yDist > 0 ? - rotValue
                                                                                           : 180 - rotValue
    }

//    Repeater{
//        anchors.fill: parent
//        model:ListModel{
//            ListElement{horizontal: "right"; vertical:"top"; angles:90}
//            ListElement{horizontal: "right"; vertical:"bottom"; angles:180}
//            ListElement{horizontal: "left"; vertical:"top"; angles:-90}
//            ListElement{horizontal: "left"; vertical:"bottom"; angles:180}
//        }
//        delegate: Repeater {
//            model: [ 0, 90, 180, 270]
//            delegate: Image {
//                visible: parent.visible
//                source: "../graphic-keyboard-highlight-top.png"
//                anchors.right: horizontal==="right" ? parent.right : undefined
//                anchors.left: horizontal==="left" ? parent.left : undefined
//                anchors.top: vertical==="top" ? parent.top : parent.bottom
//                transform: Rotation{origin.x: width/2; origin.y: 0; angle: modelData}
//                // should scale based on pixel density
//                width: geometry.scaleRatio >= 2 ? 2 : 1
//                height: parent.height
//                fillMode: Image.TileHorizontally// Math.abs(angles/90) === 1 ? Image.TileVertically :
//            }
//        }
//    }
}
