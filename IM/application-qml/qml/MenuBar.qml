import QtQuick 2.0

Item {
    id: menuBar
    property alias menuBarHeight: staticRect.height

    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    height: 50

    Rectangle {
        id:eventPanel
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: staticRect.top
        color: "blue"
        opacity: 0.0
    }

    Rectangle {
        id: staticRect
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#4e4e4e"
        border.color: "black"
        height: 50

        TabPanel {
            id: tabPanel
            anchors.fill: parent
            activeMarker: "message";

            tabData: [
                    {  markerid: "message", label: "Message" },
                    {  markerid: "user",    label: "User" },
                    {  markerid: "event",   label: "Event" },
                    {  markerid: "setting", label: "Setting" },
                ]

            Connections {
                target: messageModel
                onDataChanged: {
//                    tabPanel.markerData[0].label = messageModel.messageCount
                }
            }
        }

        // setting an initial value for the state property
        state: tabPanel.activeMarker

        // creating the list of states
        states: [
            //creating a State item with its corresponding name
            State {
                name: "message"
                PropertyChanges { target: sendMessagePage; opacity:1.0; restoreEntryValues: true }
                PropertyChanges { target: menuBar; height:100; restoreEntryValues: true }
            },

            State {
                name: "user"
                PropertyChanges { target: userPage; opacity:1.0; restoreEntryValues: true }
                PropertyChanges { target: menuBar; height:250; restoreEntryValues: true }
            },
            State {
                name: "event"
                PropertyChanges { target: eventPanel; opacity:1.0; restoreEntryValues: true }
                PropertyChanges { target: menuBar; height:400; restoreEntryValues: true }
            },
            State {
                name: "setting"
                PropertyChanges { target: settingsPage; opacity:1.0; restoreEntryValues: true }
                PropertyChanges { target: menuBar; height:100; restoreEntryValues: true }
            }
        ]

        // creating a list of transitions for the different states of the PagePanel
        transitions: [
            Transition {
                //for all states run the same transition
                from: "*"; to: "*"
                ParallelAnimation {
                NumberAnimation { target: menuBar; property: "height"; duration: 500; easing.type: Easing.InOutQuad }
                NumberAnimation { property: "opacity"; duration: 500 }
                }
            },
            Transition {
                from: ""; to: "*"
                ParallelAnimation {
                NumberAnimation { target: menuBar; property: "height"; duration: 500; easing.type: Easing.InOutQuad }
                NumberAnimation { property: "opacity"; duration: 500 }
                }
            },
            Transition {
                from: "*"; to: ""
                ParallelAnimation {
                NumberAnimation { target: menuBar; property: "height"; duration: 500; easing.type: Easing.InOutQuad }
                NumberAnimation { property: "opacity"; duration: 500 }
                }
            }
        ]

        Rectangle {
            id: borderItem
            height: 1
            width: parent.width
            color: "black"
            anchors.top: parent.top
        }
    }
}
