import QtQuick 2.0

Rectangle {
    id: root
    width: 480
    height: 400

    EventList {
        id: eventList
        anchors {
            top: root.top
            left: root.left
            right: root.right
            topMargin: 20
            leftMargin: 20
            rightMargin: 20

        }
    }

    Rectangle {
        id: createToolbar
        height: 50
        color: "yellow"
        anchors {
            bottom: root.bottom
            bottomMargin: 20
            left: root.left
            right: root.right
            leftMargin: 20
            rightMargin: 20
        }
    }
}
