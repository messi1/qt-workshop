import QtQuick 2.0

Component {

    Item {
        height: 75;
        width: parent.width
        clip: true
        property bool messageIsMine: (nickname === controller.get_nickname())
//        rotation: 180

        Image {
            id: tweetbox
            source: "images/tweetbox.png"
            anchors.left: parent.left
            anchors.leftMargin: messageIsMine ? 0 : 100
            anchors.right: parent.right
            anchors.rightMargin:  messageIsMine ? 100 : 0
        }

//        Rectangle {
//            id: tweetbox
//            anchors.left: parent.left
//            anchors.leftMargin: messageIsMine ? 0 : 100
//            anchors.right: parent.right
//            anchors.rightMargin:  messageIsMine ? 100 : 0
//            color: "ivory"
//            border.color: "orange"
//            radius: 5
//        }

        Text {
            id: tweetText
            anchors.top: tweetbox.top
            anchors.topMargin: 10
            anchors.left: tweetbox.left
            anchors.leftMargin: 10
            anchors.right: tweetbox.right
            anchors.rightMargin: 20
            anchors.bottom: tweetbox.bottom
            font.pixelSize: 16
            clip: true
            width: 256
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            text: nickname + ": " + message
            horizontalAlignment: Text.AlignLeft
            onLinkActivated: handleLink (link)
            color: messageIsMine ? "blue" : "black"
        }
    }
}
