import QtQuick 2.0

Rectangle {
    id:sendMessagePage
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: 5
    anchors.right: parent.right
    anchors.rightMargin: 5
    color: "transparent"
    opacity: 0.0

    signal submit_sendMessage(string message)

    Item {
        id: msgEnterFieldBtn
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
//        anchors.bottom: parent.bottom
//        anchors.bottomMargin: 5

        height: parent.height

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
            id: smilyButton
            width: 100
            height: (parent.height/2)-2
            anchors.top: parent.top
            anchors.right:  parent.right
            anchors.topMargin: 1
            source:  "images/chat_simley_happy.png"

        }

        Button {
            id: id_send_button
            objectName: "id_send_button"
            width: 100
            height: (parent.height/2)-2
            anchors.top: smilyButton.bottom
            anchors.right:  parent.right
            anchors.topMargin: 1
            z:5

            btnText: qsTr("send")

            onClicked: { clearAndSendMessage() }
        }
    }

    onOpacityChanged: {
        if(opacity>0.0)
            msgBox.focus=true
    }

    function clearAndSendMessage()
    {
        if(msgBox.text.length > 0) {
            submit_sendMessage(msgBox.text);
            msgBox.text = "";
        }
    }
}
