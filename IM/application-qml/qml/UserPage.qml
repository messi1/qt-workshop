import QtQuick 2.0

UserView {
    id: userListView
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

    model: userModel
    delegate: Text { text: "[" + nickname + "]"; color: if(nickname == controller.get_nickname()) return "yellow"; else return "white"; font.pixelSize: 12; font.family: "OpenSymbol"}
}
