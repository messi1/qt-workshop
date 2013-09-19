import QtQuick 2.0

Rectangle
{
    property alias btnText: buttonText.text

    id: button
    width: 106
    height: 57
    color: "white"
    border.width: 1
    border.color: "gray"
    radius: 4

    objectName: "btn_exit"

    signal clicked

    Text
    {
        id: buttonText
        anchors.fill: parent
        color: "gray"
        font.pixelSize: 27
        font.bold: true
        font.family: "OpenSymbol"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    MouseArea
    {
        id: mArea
        anchors.fill: parent
        onClicked: { button.clicked();}
        onEntered: { button.color = "lightgray"; buttonText.color = "black"; border.color = "black"}
        onExited:  { button.color = "white";  buttonText.color = "gray"; border.color = "gray" }
    }
}
