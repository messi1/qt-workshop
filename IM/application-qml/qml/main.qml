import QtQuick 2.0

Rectangle {
    width: 480
    height: 800

    Column {
//        anchors.fill: parent
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        EventView {
            onSubmit_hostEvent: controller.invoke_send_hostEvent(title)


        }

        SendMessage {
            onSubmit_sendMessage: controller.invoke_send_message(message)
////            anchors.fill: parent
////            anchors.margins: 3
        }
    }
}

