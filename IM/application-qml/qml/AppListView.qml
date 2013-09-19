import QtQuick 2.0

Rectangle {
    id: mainRect
    property alias listView: listview
    property alias model: listview.model
    property alias delegate: listview.delegate

    ListView {
        id: listview
        anchors.fill: parent
        highlight: Rectangle { color: "lightsteelblue"; radius: 4}
        focus: true
        anchors.margins: 5
        clip:true
    }

//    onHeightChanged: { listview.contentHeight = mainRect.height }
}
