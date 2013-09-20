import QtQuick 2.0

Item {
    id: root
    width: 400
    height: 60

    signal clicked()

    property string eventTitle: ""

    TextBox {
        id: newEventTitle
        objectName: "id_newEventTitle"
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: createEventButton.left
        anchors.rightMargin: 3
        height: parent.height
    }

    Button {
        id: createEventButton
        objectName: "id_createEventButton"
        width: 110
        height: parent.height-2
        anchors.top: parent.top
        anchors.right:  parent.right
        anchors.topMargin: 1

        btnText: qsTr("create")

        onClicked: {
            if(newEventTitle.text.length > 0) {
                root.eventTitle = newEventTitle.text
                root.clicked()
                newEventTitle.text = "";
            }
        }
    }
}
