import QtQuick 2.0

Rectangle {
    id: settingAndLogo
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    color: "#4e4e4e"
    border.color: "black"
    height: 50

    SettingsView {
        id: settingsView
        anchors.bottomMargin: -10
        anchors.leftMargin: -10

        z: 5
        height: 70
    }

    Image
    {
        id: imgBBV
        z: 2
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: -60
        scale: 0.4
        source: "images/BBV_Logo.png"
    }
}
