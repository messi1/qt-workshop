/****************************************************************************
**
** Copyright (C) 2012 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
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

// MarkerPanel.qml

Item {
    id: root
    anchors.fill: parent
    property alias activeTab: rowLayout.activeTab

    // a property of type string to hold the value of the current active marker
    property string activeMarker: ""

    // a list for holding respective data for a Marker item.
    property variant tabData: []

    Row {
        id: rowLayout
        anchors.topMargin: 2
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 15
        property int activeTab

        Repeater {
            id:repeater
            // using the defined list as our model
            model: tabData
            delegate:
                Tab {
                id: marker

                // the active property of the Marker is true only when the marker
                // item is the one current active one set on the onClicked signal
                active: rowLayout.activeTab == index

                label: modelData.label

                // handling the clicked signal of the Marker item, setting the currentMarker property
                // of MarkerPanel based on the clicked Marker
                onClicked: {
                    if(rowLayout.activeTab == index) {
                        rowLayout.activeTab = -1
                        root.activeMarker = ""
                    }
                    else {
                        rowLayout.activeTab = index
                        root.activeMarker = modelData.markerid
                    }
                } // onClicked
            } // Tab
        } // Repeater
    } // Row
}
