import QtQuick 2.0

Rectangle {
    id: mainRect
    width: 180; height: 200

    Component {
        id: contactDelegate
        Item {
            width: mainRect.width
            height: 40

            Column {
                Text { text: '<b>Nickname:</b> ' + nickname }
                Text { text: '<b>Message:</b> ' + message }
                spacing: 10
            }
            MouseArea {
                id: mouse_area1
                z: 1
                hoverEnabled: false
                anchors.fill: parent
                onClicked:
                {
                    listview.currentIndex = index
                }
            }
        }
    }

    ListView {
        id: listview
        anchors.fill: parent
        model: messageModel
        delegate: Text { text: "Message: " + nickname + ", " + message }
        highlight: Rectangle { color: "lightsteelblue"; radius: 4}
        focus: true
        topMargin: 5
        leftMargin: 5
    }
}
