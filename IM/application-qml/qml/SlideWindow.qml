import QtQuick 2.0

Item {
    id: slideWindow
    property alias on: button.on
    property string onText: "On"
    property string offText: "Off"
    width:  150
    height: 350
    signal toggled(bool on)

    Rectangle {
        id: background
        color: "transparent"
        width: parent.width
        height: parent.height

        anchors.fill: parent
    }

    Rectangle {
        id: eventWindow
        width: parent.width
        height:0
        anchors.top: parent.top
        anchors.topMargin: -2
        anchors.bottom: button.top
        anchors.bottomMargin: -1
        color: "#4e4e4e"
        border.width: 1
        border.color: "white"
        radius: 2
        opacity: 0.9
    }

    Rectangle {
        id: button
        property bool on: false

        height: 30
        width: 100
        color: button.on ? "grey" : "#2d2d2d"
        border.width: 1
        border.color: button.on ? "white" : "black"
        radius: 2
        y:0
        z:-1
        anchors.right: parent.right

        onYChanged: { eventWindow.height = button.y }

        Text
        {
            id: label
            anchors.fill: parent
            text: button.on ? onText : offText
            font.family: "OpenSymbol"
            font.pixelSize: 18
            font.bold: true
            color: button.on ? "#2d2d2d" : "grey"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment:  Text.AlignVCenter
        }

        MouseArea {
            id: bla
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.YAxis
            drag.minimumY: background.border.width
            drag.maximumY: background.height - button.height - background.border.width

            onClicked: {
                if(slideWindow.state=="on")
                    slideWindow.state="off"
                else
                    slideWindow.state="on"
            }

            onReleased: {
                if(button.y > ((drag.maximumY) / 2)) {
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
                y: background.height - button.height - background.border.width
                on: true
            }
        },
        State {
            name: "off"
            PropertyChanges {
                target: button
                y: background.border.width
                on: false
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: "y"
            duration: 1000
            easing.type: Easing.OutQuad
        }
    }
}
