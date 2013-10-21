import QtQuick 2.0
import "components"

Rectangle {
    id: sendMessage
    width: 470
    color: "transparent"

    Delegate { id: delegate; }

    MyListView {
        id: listview
        LayoutMirroring.enabled: true

//        rotation: 180

        color: "lightblue"
//        color: "#2d2d2d"
        border.width: 1
        border.color: "white"
        radius: 3
        anchors.top: parent.top
//        anchors.bottom: msgEnterFieldBtn.top
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 5
        width: parent.width
        model: messageModel
        delegate: delegate
//        delegate: Text { text: nickname + ": " + message; color: if(nickname == controller.get_nickname()) return "yellow"; else return "white"; font.pixelSize: 20; font.family: "OpenSymbol"}
        verticalLayoutDirection: ListView.BottomToTop

    }
}
