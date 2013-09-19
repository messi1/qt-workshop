import QtQuick 2.0

Rectangle {
    width: 480
    height: 800

    SendMessage {
        onSubmit: controller.invoke_send_message(message);
        anchors.fill: parent
        anchors.margins: 3
    }
}

