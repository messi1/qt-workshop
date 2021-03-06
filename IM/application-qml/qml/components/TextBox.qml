/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.0

Item/*FocusScope*/ {
    id: focusScope
    width: 250; height: 28

    property alias text: textInput.text

    signal enterPressed()

    BorderImage {
        source: "../images/lineedit-bg.png"
        width: parent.width; height: parent.height
        border { left: 4; top: 4; right: 4; bottom: 4 }
    }

    BorderImage {
        source: "../images/lineedit-bg-focus.png"
        width: parent.width; height: parent.height
        border { left: 4; top: 4; right: 4; bottom: 4 }
        visible: parent.activeFocus ? true : false
    }

    Text {
        id: typeSomething
        anchors.fill: parent; anchors.leftMargin: 8
        verticalAlignment: Text.AlignVCenter
        text: "Type something..."
        color: "gray"
        font.italic: true
    }

    TextInput {
        id: textInput
        z:5
        objectName: "id_message_input"
        anchors { /*top: parent.top; bottom: parent.bottom;*/ left: parent.left; leftMargin: 8; right: clear.left; rightMargin: 10; verticalCenter: parent.verticalCenter }
//        height: parent.height
//        verticalAlignment: verticalCenter
        focus: true
        selectByMouse: true
        color: "black"
        clip: true
        font.pixelSize: 15
        font.family: "OpenSymbol"
        wrapMode: "WordWrap"
        Keys.onPressed: {
            if(event.key==Qt.Key_Escape || event.key==Qt.Key_Enter || event.key==Qt.Key_Return) {
                enterPressed();
            }
        }
    }

    Image {
        id: clear
        anchors { right: parent.right; rightMargin: 10; verticalCenter: parent.verticalCenter }
        source: "../images/clear.png"
        opacity: 0
        scale: 2

        MouseArea { 
            anchors.fill: parent
            onClicked: {
                textInput.text = '';
                focusScope.focus = true; /*textInput.openSoftwareInputPanel();*/
            }
        }
    }

    states: State {
        name: "hasText"; when: textInput.text != ''
        PropertyChanges { target: typeSomething; opacity: 0 }
        PropertyChanges { target: clear; opacity: 1 }
    }

    transitions: [
        Transition {
            from: ""; to: "hasText"
            NumberAnimation { exclude: typeSomething; properties: "opacity" }
        },
        Transition {
            from: "hasText"; to: ""
            NumberAnimation { properties: "opacity" }
        }
    ]

    onFocusChanged: {
        textInput.focus=true
    }
}
