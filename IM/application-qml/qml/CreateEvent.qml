import QtQuick 2.0

Item {
    id: root
    width: 400
    height: 60

    TextBox {
        id: eventName
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: createEventButton.left
        anchors.rightMargin: 3
        height: parent.height
    }

    Button {
        id: createEventButton
        objectName: "createEventButton"
        width: 100
        height: parent.height-2
        anchors.top: parent.top
        anchors.right:  parent.right
        anchors.topMargin: 1

        btnText: "create"

        /*onClicked: {
            if(eventName.text.length > 0) {
                submit(eventName.text);
                eventName.text = "";
            }
        }*/
    }
}
