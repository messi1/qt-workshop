import QtQuick 2.0

Rectangle {
    id: settingsPage
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.leftMargin: 5
    anchors.right: parent.right
    anchors.rightMargin: 5
    color: "transparent"
    opacity: 0.0

    Text{
        id: nickText
        text: qsTr("Nickname")
        anchors.top: parent.top
        anchors.left: parent.left
//                anchors.leftMargin: 10
        color: "white"
        font.family: "OpenSymbol"
        font.pixelSize: 15
        width:150
    }

    BorderImage {
        id: borderImage
        source: "images/lineedit-bg.png"
        border { left: 4; top: 4; right: 4; bottom: 4 }
        anchors.top: parent.top
        anchors.left: nickText.left
        anchors.right: parent.right
        height: parent.height
    }

//    FocusScope
//    {
//        id: nicknameInput
//        anchors.fill: borderImage

    TextInput{
        id: nicknameInput
        anchors.fill: parent
        anchors.margins: 5
        color: "black"
        font.family: "OpenSymbol"
        font.pixelSize: 16
        maximumLength: 24

        //onTextChanged: controller.setNickName=nicknameInput.text

        Keys.onPressed: {
            if(event.key==Qt.Key_Escape) {
                hide()
            }
            if(event.key==Qt.Key_Return) {
                controller.setNickName=nicknameInput.text
            }
        }

        Connections {
            target: controller
            onNicknameChanged: {
                nicknameInput.text = controller.setNickName
            }
        }
    } // TextInput

    onOpacityChanged: {
        if(opacity>0.0)
            nicknameInput.focus=true
    }
//    }

//    Rectangle {
//        anchors.horizontalCenter: parent.horizontalCenter
//        width: parent.width - 32
//        height: 1
//        color: "#404040"
//    }
//}
}
