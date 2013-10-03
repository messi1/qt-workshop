import QtQuick 2.0

Rectangle {
    id: sendEventPage
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: 5
    anchors.right: parent.right
    anchors.rightMargin: 5
    opacity: 0.0
    color: "#2d2d2d"
    border.width: 1
    border.color: "white"
    radius: 4

    Grid {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        columns: 2
        spacing: 6

        Rectangle { color: "#aa6666"; width: 50; height: 50 }
        Rectangle { color: "#aaaa66"; width: 50; height: 50 }
        Rectangle { color: "#9999aa"; width: 50; height: 50 }
        Rectangle { color: "#6666aa"; width: 50; height: 50 }
    }
}
