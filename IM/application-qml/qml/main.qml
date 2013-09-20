import QtQuick 2.0

Rectangle {
    id: mainView
    width: 480
    height: 800

    color: "#2d2d2d"

    Item {
        anchors.fill: parent
        anchors.margins: 5

        Rectangle {
            id: titleRect
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            color: "#4e4e4e"
            border.color: "black"
            height: 50

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

            InfoView {
                id: infoView
                z: 5
            }
        }

        Text {
            id: userTitleText
            text: qsTr("User List")
            font.family: "OpenSymbol"
            font.pixelSize: 15
            color: "white"
            anchors.bottom: userListView.top
        }

        MyListView {
            id: userListView
            anchors.top: titleRect.bottom
            anchors.topMargin: 30
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: sendMessage.top
            anchors.bottomMargin: 30
            color: "#2d2d2d"
            border.width: 1
            border.color: "white"
            radius: 4

            model: userModel
            delegate: Text { text: "[" + nickname + "]"; color: "white"; font.pixelSize: 20; font.family: "OpenSymbol"}
        }

        Text {
            id: msgTitleText
            text: qsTr("Message List")
            font.family: "OpenSymbol"
            font.pixelSize: 15
            color: "white"
            anchors.bottom: sendMessage.top
        }

        SendMessage {
            id: sendMessage
            anchors.top: userListView.Bottom
            anchors.topMargin: 30
            anchors.bottom: settingAndLogo.top
            anchors.bottomMargin: 5
            anchors.left: parent.left
            anchors.right: parent.right
            onSubmit_sendMessage: controller.invoke_send_message(message);
        }

        Rectangle {
            id: settingAndLogo
            anchors.bottom: parent.bottom
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
    }
}
