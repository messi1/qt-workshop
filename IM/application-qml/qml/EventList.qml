import QtQuick 2.0

Rectangle {
    width: 480
    height: 400
    color: "#403939"

    Column {
        id: layout
        anchors.fill: parent
        anchors.leftMargin: 10
        spacing: 5

        Repeater {
            model: 4
            delegate: Event
            { id: event}
        }
    }
}


