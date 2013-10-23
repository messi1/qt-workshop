import QtQuick 2.0

Rectangle {
    id: mainView
    width: 480
    height: 800

    color: "#2d2d2d"

    Item {
        anchors.fill: parent
//        anchors.margins: 5
//        anchors.rightMargin: 5

        TitleBar {
            id: titleBar
        }

        Text {
            id: msgTitleText
            text: qsTr("Message List")
            font.family: "OpenSymbol"
            font.pixelSize: 15
            color: "white"
            anchors.top: titleBar.bottom
            anchors.topMargin: 5
        }

        MessageList {
            id: sendMessage
            anchors.top: msgTitleText.bottom
            anchors.topMargin: 5
            anchors.bottom: menuBar.top
            anchors.bottomMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
        }

        MenuBar {
            id: menuBar
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            z:5
        }

        SendMessagePage {
            id: sendMessagePage
            anchors.top: menuBar.top
            anchors.left: menuBar.left
            anchors.right: menuBar.right
            anchors.bottom: menuBar.bottom
            anchors.bottomMargin: menuBar.menuBarHeight+10
            onSubmit_sendMessage: controller.invoke_send_message(message);
            z:5
        }

        UserPage {
            id: userPage
            anchors.top: menuBar.top
            anchors.left: menuBar.left
            anchors.right: menuBar.right
            anchors.bottom: menuBar.bottom
            anchors.bottomMargin: menuBar.menuBarHeight+10
        }

        SendEventPage {
            id: sendEventPage
            anchors.top: menuBar.top
            anchors.left: menuBar.left
            anchors.right: menuBar.right
            anchors.bottom: menuBar.bottom
            anchors.bottomMargin: menuBar.menuBarHeight+10
        }

        SettingsPage {
            id: settingsPage
            anchors.top: menuBar.top
            anchors.left: menuBar.left
            anchors.right: menuBar.right
            anchors.bottom: menuBar.bottom
            anchors.bottomMargin: menuBar.menuBarHeight+10
        }
    }
}

//        Text {
//            id: userTitleText
//            text: qsTr("User List")
//            font.family: "OpenSymbol"
//            font.pixelSize: 15
//            color: "white"
//            anchors.bottom: userListView.top
//        }

//        MyListView {
//            id: userListView
//            anchors.top: titleRect.bottom
//            anchors.topMargin: 35
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.bottom: sendMessage.top
//            anchors.bottomMargin: 30
//            color: "#2d2d2d"
//            border.width: 1
//            border.color: "white"
//            radius: 4

//            model: userModel
//            delegate: Text { text: "[" + nickname + "]"; color: if(nickname == controller.get_nickname()) return "yellow"; else return "white"; font.pixelSize: 20; font.family: "OpenSymbol"}
//        }
