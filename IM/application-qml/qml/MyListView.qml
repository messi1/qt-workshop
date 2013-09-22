import QtQuick 2.0

Rectangle {
    id: mainRect
    property alias currentIndex: listview.currentIndex
    property alias model: listview.model
    property alias delegate: listview.delegate
    property alias verticalLayoutDirection: listview.verticalLayoutDirection


    ListView {
        id: listview
        anchors.fill: parent
        anchors.margins: 5
//        highlight: Rectangle { color: "lightsteelblue"; radius: 4; z:0}
        focus: true
        clip:true
        spacing: 10
    }
}

