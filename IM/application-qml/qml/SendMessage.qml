import QtQuick 2.0

Rectangle {
    id: sendMessage
    width: 470
    height: 390


    signal submit_sendMessage(string message)

    Component {
        id: contactDelegate
        Item {
            width: sendMessage.width
            height: 40

            Row {
                Text { text: '<b>Name:</b> ' + name }
                Text { text: '<b>Number:</b> ' + number }
                spacing: 10
            }
            MouseArea {
                id: mouse_area1
                z: 1
                hoverEnabled: false
                anchors.fill: parent
                onClicked: {listview.currentIndex = index}
            }
        }
    }

    MessageListView {
        id: listview

        color: "red"
        border.width: 1
        border.color: "gray"
        radius: 4
//        anchors.top: sendMessage.top
        anchors.bottom: msgEnterFieldBtn.top
//        anchors.bottomMargin: 13
        width: parent.width
        height: 317
        delegate: contactDelegate
        model: ContactModel {}
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
                if(msgBox.text.length > 0) {
                    submit_sendMessage(msgBox.text);
                    msgBox.text = "";
                }
            }
        }
    }
}

