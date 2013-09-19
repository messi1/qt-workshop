import QtQuick 2.0

Rectangle {
    id: sendMessage
    width: 470
    height: 390
    color: "transparent"


    signal submit_sendMessage(string message)

    MyListView {
        id: listview

        color: "#2d2d2d"
        border.width: 1
        border.color: "white"
        radius: 4
        anchors.top: parent.top
        anchors.bottom: msgEnterFieldBtn.top
        anchors.bottomMargin: 5
        width: parent.width
        height: 317
        model: messageModel
        delegate: Text { text: nickname + ": " + message; color: if(nickname == controller.get_nickname()) return "yellow"; else return "white"; font.pixelSize: 20; font.family: "OpenSymbol"}
    }


    Item {
        id: msgEnterFieldBtn
        anchors.bottom: parent.bottom
        width: parent.width
        height: 50

        TextBox {
            id: msgBox
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: id_send_button.left
            anchors.rightMargin: 5
            height: parent.height

            onEnterPressed: { clearAndSendMessage() }
        }

        Button {
            id: id_send_button
            objectName: "id_send_button"
            width: 100
            height: parent.height-2
            anchors.top: parent.top
            anchors.right:  parent.right
            anchors.topMargin: 1

            btnText: qsTr("send")

            onClicked: { clearAndSendMessage() }
        }
    }

    function clearAndSendMessage()
    {
        if(msgBox.text.length > 0) {
            submit_sendMessage(msgBox.text);
            msgBox.text = "";
        }
    }
}

