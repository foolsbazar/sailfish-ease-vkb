/*
 * Copyright (C) 2013 Jolla ltd. and/or its subsidiary(-ies). All rights reserved.
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
 * Neither the name of Jolla ltd nor the names of its contributors may be
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

FunctionKey {
    id: symbolKey

    property int _charactersWhenPressed
    property bool _quickPicking

    separator: false

    caption: ""
    text: attributes.inSymView ? "0" : ""
    implicitWidth: functionKeyWidth
    keyType: KeyType.SymbolKey
    states: [
        State {
            name: "simView"
            when: attributes.inSymView
            PropertyChanges {
                target: symbolKey
                background.opacity: 0
            }
            PropertyChanges {
                target: textItem
                font.pixelSize: Theme.fontSizeExtraLarge
                text: symbolKey.text

            }
        }
    ]
    //swipeHighlightEnable: attributes.inSymView
    property alias label: textItem.text

    Rectangle {
        id: backgroundItem
        color: parent.pressed || attributes.inSymView2 ? Theme.highlightBackgroundColor : Theme.primaryColor
        opacity: parent.pressed || attributes.inSymView2 ? 0.6 : 0.17
        radius: geometry.keyRadius
        anchors { fill: parent; margins: Theme.paddingMedium }
        visible: !attributes.inSymView
    }

    Text {
        id: textItem
        anchors.centerIn: parent
        anchors.horizontalCenterOffset: Math.round((leftPadding - rightPadding) / 2)
        width: parent.width - leftPadding - rightPadding - 4
        fontSizeMode: Text.HorizontalFit
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: Theme.fontSizeMedium
        font.family: Theme.fontFamily
        color: parent.pressed ? Theme.highlightColor : Theme.primaryColor
        text: "*.$"
        //visible: !attributes.inSymView
    }

    onClicked: {
        if (!keyboard.inSymView)
            keyboard.inSymView2 = !keyboard.inSymView2
    }
}
