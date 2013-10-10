import QtQuick 2.0

Rectangle {
    id: root
    width: 470
    height: 350
    color: "transparent"

    Component {
        id: contactDelegate
        Item {
            width: root.width
            height: 40

            Column {
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b>Number:</b> ' + number }
                spacing: 10
            }
            MouseArea {
                id: mouse_area1
                z: 1
                hoverEnabled: false
                anchors.fill: parent
                onClicked: {eventList.currentIndex = index}
            }
        }
    }

    CreateEvent {
        id: createToolbar
        height: 50
        anchors {
            bottom: root.bottom
            left: root.left
            right: root.right
        }

        onClicked: {
            submit_hostEvent(createToolbar.eventTitle)
            console.debug("Create new event: ", createToolbar.eventTitle)
        }

    }
}
