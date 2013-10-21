import QtQuick 2.0

Rectangle {
    id: titleRect
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: -1
    anchors.right: parent.right
    anchors.rightMargin: -1
    color: "#4e4e4e"
    border.color: "black"
    height: 50
    z:4

    Text {
        id: titleText
        text: qsTr("Messenger")
        font.family: "OpenSymbol"
        font.pixelSize: 27
        font.bold: true
        color: "white"

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 5
    }

    Image
    {
        id: imgBBV
        z: 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: -60
        scale: 0.4
        source:"images/BBV_Logo.png"
    }
}
