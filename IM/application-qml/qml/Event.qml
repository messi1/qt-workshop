import QtQuick 2.0

Rectangle {
    id: root
    width: 400
    height: 40
    color: "lightblue"

    Text {
        id: title
        text: qsTr("Beer")
        anchors {
            verticalCenter: root.verticalCenter
            left: root.left
            leftMargin: 10
        }
    }

    Text {
        id: participants
        text: qsTr("7")
        anchors {
            verticalCenter: root.verticalCenter
            left: root.left
            leftMargin: root.width * 2 / 3
        }
    }

    Rectangle {
        id: gobutton
        width: 30
        height: 30
        color: "lightgreen"

        anchors {
            verticalCenter: root.verticalCenter
            left: participants.right
            leftMargin: 5
        }
        Text {
            text: qsTr("go")
            anchors.centerIn: parent

        }
    }

    Rectangle {
        id: registerbutton
        width: 30
        height: 30
        color: "green"

        anchors {
            verticalCenter: root.verticalCenter
            left: gobutton.right
            leftMargin: 5
        }
        Text {
            text: qsTr("P")
            anchors.centerIn: parent

        }
    }

}
