import QtQuick 2.0

Rectangle {
    width: 480
    height: 400
    color: "#403939"

//    Column {
//        id: layout
//        anchors.fill: parent
//        anchors.leftMargin: 10
//        spacing: 5

//        Repeater {
//            model: 4
//            delegate: Event
//            { id: event}
//        }
//    }
    Component {
        id: contactDelegate
        Item {
            width: mainRect.width
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
                onClicked: {listview.currentIndex = index}
            }
        }
    }
}


