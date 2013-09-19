import QtQuick 2.0

Rectangle {
    width: 480
    height: 800

    Item {
        anchors.fill: parent
        anchors.margins: 5


        EventView {
            id: eventView
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 5
        }

        SendMessage {
            id: sendMessage
            anchors.top: eventView.bottom
            anchors.topMargin: 5
            anchors.bottom: parent.bottom
//            height: 380
            anchors.horizontalCenter: parent.horizontalCenter

            onSubmit: controller.invoke_send_message(message);
    ////            anchors.fill: parent
    ////            anchors.margins: 3
        }

        SettingsView {
            id: settingsView
                anchors.left: parent.left
                anchors.bottom: parent.top
    //            anchors.bottomMargin: 5
            z: 5
//            scale: 1
        }
    }
}
