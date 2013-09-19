import QtQuick 2.0

Rectangle {
    id: root
    width: 480
    height: 400

    signal submit_hostEvent(string title)

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

    CreateEvent {
        id: createToolbar
        height: 50
        anchors {
            bottom: root.bottom
            bottomMargin: 20
            left: root.left
            right: root.right
            leftMargin: 20
            rightMargin: 20
        }

        onClicked: {
            submit_hostEvent(createToolbar.eventTitle)
            console.debug("Create new event: ", createToolbar.eventTitle)
        }

    }
}
