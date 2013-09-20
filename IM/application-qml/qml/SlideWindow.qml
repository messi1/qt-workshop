import QtQuick 2.0

Item {
    id: slideWindow
    property alias on: handle.on
    property string handleText: "Event"
    property int winHeight: 400
//    anchors.fill: parent

    signal toggled(bool on)

    Rectangle {
        id: handle
        property bool on: false

        height: 30
        width: 100
        color: handle.on ? "grey" : "#2d2d2d"
        border.width: 1
        border.color: "black"
        radius: 2
        z: 15

    //    x:background.border.width
    //    y:background.border.width

        Text
        {
            id: label
            anchors.fill: parent
            text: handleText //handle.on ? onText : offText
            font.family: "OpenSymbol"
            font.pixelSize: 15
            font.bold: true
            color: handle.on ? "#2d2d2d" : "grey"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment:  Text.AlignVCenter
        }

        MouseArea {
            id: bla
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: 0
            drag.maximumY: winHeight

            onReleased: {
                if(handle.y > ((drag.maximumY) / 2)) {
                    slideWindow.state = ""
                    slideWindow.state = "on"
                    toggled(true)
                }
                else {
                    slideWindow.state = ""
                    slideWindow.state = "off"
                    toggled(false)
                }
            }
        }
    }

    // using states to differentiate between "on" and "off"
    states: [
        State {
            name: "on"
            PropertyChanges {
                target: button
                y: winHeight - handle.height
                on: true
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: button
                y: 0
                on: false
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: "y"
            duration: 400
            easing.type: Easing.OutQuad
        }
    }
}
