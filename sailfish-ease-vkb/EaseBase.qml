/*
 * Copyright (C) 2012-2013 Jolla ltd and/or its subsidiary(-ies). All rights reserved.
 *
 * Contact: Pekka Vuorela <pekka.vuorela@jollamobile.com>
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *l'orario 
 * Redistributions of source code must retain the above copyright notice, this list
 * of conditions and the following disclaimer.
 * Redistributions in binary form must reproduce the above copyright notice, this list
 * of conditions and the following disclaimer in the documentation and/or other materials
 * provided with the distribution.
 * Neither the name of Jolla Ltd nor the names of its contributors may be
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

KeyboardEaseLayout {
    id: mylay
    splitSupported: false
    useTopItem: !mylay.isLandscape
    height: 500
    property real rowHeight: isLandscape ? 0.8 * parent.width/7 : 0.75 * parent.width/4

    accentMap: {
            "a": {"´": "á", "^": "â", "¨": "ä", "`": "à", "°": "å", "~": "ã"},
            "A": {"´": "Á", "^": "Â", "¨": "Ä", "`": "À", "°": "Å", "~": "Ã"},
            "e": {"´": "é", "^": "ê", "¨": "ë", "`": "è"},
            "E": {"´": "É", "^": "Ê", "¨": "Ë", "`": "È"},
            "o": {"´": "ó", "^": "ô", "¨": "ö", "`": "ò",           "~": "õ"},
            "O": {"´": "Ó", "^": "Ô", "¨": "Ö", "`": "Ò",           "~": "Õ"},
            "i": {"´": "í", "^": "î", "¨": "ï", "`": "ì"},
            "I": {"´": "Í", "^": "Î", "¨": "Ï", "`": "Ì"},
            "u": {"´": "ú", "^": "û", "¨": "ü", "`": "ù"},
            "U": {"´": "Ú", "^": "Û", "¨": "Ü", "`": "Ù"},
            "y": {"´": "ý",           "¨": "ÿ"},
            "Y": {"´": "Ý",           "¨": "Ϋ"},
            "n": {                                                  "~": "ñ"},
            "N": {                                                  "~": "Ñ"},
            "c": {"¸": "ç"},
            "C": {"¸": "Ç"}
    }

    property var easeLayout: ({})

    property alias symbolCaption: symbol.caption
    property alias specialCaption: special.label

    KeyboardEaseRow {
        id:row1
        height: rowHeight
        CharacterEaseKey {keyValue: easeLayout["topLeft"]}
        CharacterEaseKey {keyValue: easeLayout["top"] }
        CharacterEaseKey {keyValue: easeLayout["topRight"]}

        FunctionKey { // copied  EnterKey: i don't know why but it doesn't like as an element
                  active: mylay.isLandscape
                  height:parent.height
                  icon.source: MInputMethodQuick.actionKeyOverride.icon
                  caption:  MInputMethodQuick.actionKeyOverride.label
                  key: Qt.Key_Return
                  implicitWidth: symbol.width
                  enabled: MInputMethodQuick.actionKeyOverride.enabled
                  background.opacity: pressed ? 0.6 : MInputMethodQuick.actionKeyOverride.highlighted ? 0.4 : 0.17
        }
        BackspaceKey { height:parent.height; implicitWidth: symbol.width; active: !mylay.isLandscape }

        CharacterEaseKey {keyValue: easeLayout["topLeft"];  active: mylay.isLandscape}
        CharacterEaseKey {keyValue: easeLayout["top"];      active: mylay.isLandscape}
        CharacterEaseKey {keyValue: easeLayout["topRight"]; active: mylay.isLandscape}
    }
    KeyboardEaseRow {
        id:row2
        height: rowHeight
        CharacterEaseKey {keyValue: easeLayout["left"] }
        CharacterEaseKey {keyValue: easeLayout["center"]; showSeparator: true}
        CharacterEaseKey {keyValue: easeLayout["right"] }

        SymbolKey    { height:parent.height; active: mylay.isLandscape; caption: symbol.caption}
        ShiftEaseKey { height:parent.height; implicitWidth: symbol.width;   active: !mylay.isLandscape }

        CharacterEaseKey {keyValue: easeLayout["left"];   active: mylay.isLandscape }
        CharacterEaseKey {keyValue: easeLayout["center"]; active: mylay.isLandscape; showSeparator: true}
        CharacterEaseKey {keyValue: easeLayout["right"];  active: mylay.isLandscape }
    }
    KeyboardEaseRow {
        id:row3
        height: rowHeight
        CharacterEaseKey {keyValue: easeLayout["bottomLeft"]}
        CharacterEaseKey {keyValue: easeLayout["bottom"] }
        CharacterEaseKey {keyValue: easeLayout["bottomRight"]}

        SymbolKey      {height:parent.height; id: symbol; active: !mylay.isLandscape }
        SpecialEaseKey {height:parent.height; id: special; active: mylay.isLandscape; implicitWidth: symbol.width}


        CharacterEaseKey {keyValue: easeLayout["bottomLeft"];  active: mylay.isLandscape}
        CharacterEaseKey {keyValue: easeLayout["bottom"];      active: mylay.isLandscape}
        CharacterEaseKey {keyValue: easeLayout["bottomRight"]; active: mylay.isLandscape}
    } 
    KeyboardEaseRow {
        id:row4
        height: parent.width/4/1.75
        splitIndex: 3
        visible: portraitMode
        SpecialEaseKey { height:parent.height; label: special.label}

        SpacebarKey { height:parent.height }
        EnterKey {height:parent.height; }
    }

    KeyboardEaseRow {
        id: landscapeBottomRow
        height: parent.width/7/2
        visible:!portraitMode

        SpacebarKey { height:parent.height; active: mylay.isLandscape }
        KeyBase {
            implicitWidth: symbol.width * 2.7
            clip: true
            active: mylay.isLandscape
            y:0
            height:parent.height;
            Loader {
                id: topItem
                sourceComponent: mylay.isLandscape && keyboard.inputHandler ? keyboard.inputHandler.topItem : null
                anchors.fill: parent
                anchors.leftMargin: symbol.width / 2
            }
        }
        ShiftEaseKey { height:parent.height; active: mylay.isLandscape }
        BackspaceKey { height:parent.height; active: mylay.isLandscape }
        SpacebarKey  { height:parent.height; active: mylay.isLandscape }
    }
}
