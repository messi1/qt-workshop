import QtQuick 2.0
import "components"

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

        // Only show the scrollbars when the view is moving.
         states: State {
             name: "ShowBars"
             when: listview.movingVertically || listview.movingHorizontally
             PropertyChanges { target: verticalScrollBar; opacity: 1 }
             PropertyChanges { target: horizontalScrollBar; opacity: 1 }
         }

         transitions: Transition {
             NumberAnimation { properties: "opacity"; duration: 400 }
         }

         Connections {
            target: mainRect.model
            onRowsInserted: listview.positionViewAtEnd()
        }
    }

    ScrollBar {
        id: verticalScrollBar
        width: 12;
        height: listview.height
//        anchors.right: mainRect.right
        opacity: 0
        orientation: Qt.Vertical
        position: listview.visibleArea.yPosition
        pageSize: listview.visibleArea.heightRatio
        x: 0
        y: 0
    }
}

