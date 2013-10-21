import QtQuick 2.0

Rectangle {
    id: tab
    width: 100
    height: 30
    color: "#4e4e4e"
    border.color: tab.active ? "black" : "#2d2d2d"
    border.width: 1

    // declaring the clicked() signal to be used in the MarkerPanel
    signal clicked()

    property bool active: false
    property alias label: label.text

    // creating the two states representing the respective
    // set of property changes
    states: [
        // the hovered state is set when the user has the mouse hovering
        // the marker item.
//        State {
//            name: "hovered"
//            //this condition makes this state active
//            when: mouseArea.containsMouse && !root.active
//            PropertyChanges { target: root; x: 5 }
//        },

        State {
            name: "selected"
            when: root.active
            PropertyChanges { target: root; x: 20 }
        }
    ]

    transitions: [
//        Transition {
//            to: "hovered"
//            NumberAnimation { target: root; property: "x"; duration: 300 }
//        },

        Transition {
            to: "selected"
            NumberAnimation { target: root; property: "x"; duration: 300 }
        },

        //a transition for the default state
        Transition {
            to: ""
            NumberAnimation { target: root; property: "x"; duration: 300 }
        }
    ]

    Text
    {
        id: label
        anchors.fill: parent
        font.family: "OpenSymbol"
        font.pixelSize: 12
        font.bold: tab.active
        color: tab.active ? "white" : "grey"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment:  Text.AlignVCenter
    }

    // creating a MouseArea type to intercept the mouse click
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: tab.clicked()
    }
}
