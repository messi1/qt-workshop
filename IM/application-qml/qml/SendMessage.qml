import QtQuick 2.0

Rectangle {
    width: 480
    height: 400

    signal submit(string message)

    AppListView {
        color: "white"
        border.width: 1
        border.color: "gray"
        radius: 4
        anchors.top: parent.top
        anchors.bottom: msgEnterFieldBtn.top
        anchors.bottomMargin: 3
        width: parent.width
    }


    Item {
        id: msgEnterFieldBtn
        anchors.bottom: parent.bottom
        width: parent.width
        height: 60

        TextBox {
            id: msgBox
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: id_send_button.left
            anchors.rightMargin: 3
            height: parent.height
        }

        Button {
            id: id_send_button
            objectName: "id_send_button"
            width: 100
            height: parent.height-2
            anchors.top: parent.top
            anchors.right:  parent.right
            anchors.topMargin: 1

            btnText: "send"

            onClicked: {
                if(msgBox.id_message_input.length > 0) {
                    submit(msgBox.id_message_input);
                    msgBox.id_message_input = "";
                }
            }
        }
    }
}

