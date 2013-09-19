import QtQuick 2.0

Rectangle {
    width: 180; height: 200

    Component {
        id: contactDelegate
        Item {
            width: 180; height: 40
            Column {
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b>Number:</b> ' + number }
            }
            MouseArea {
                id: mouse_area1
                z: 1
                hoverEnabled: false
                anchors.fill: parent
                onClicked: {listview.currentIndex = index}
            }
        }
    }

    ListView {
        id: listview
        anchors.fill: parent
        model: ContactModel {}
        delegate: contactDelegate
        highlight: Rectangle { color: "lightsteelblue"; radius: 5 }
        focus: true
        topMargin: 5
        leftMargin: 5
    }
}
