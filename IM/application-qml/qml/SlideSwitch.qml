import QtQuick 2.0

Item {
    id: slideSwitch
    property alias on: button1.on
    property string onText: "On"
    property string offText: "Off"
    state: "off"
    width:  350
    height: 500
    signal toggled(bool on)

    Rectangle {
        id: background
        property bool hover: false
        color: "#2d2d2d"
        border.width: 4
        border.color: "white"
        radius: 8
        width: parent.width
        height: parent.height

        anchors.fill: parent
    }

    Rectangle {
        id: eventWindow1
        width: 0
        height:parent.height
        anchors.top: parent.top
        anchors.topMargin: background.border.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: background.border.width
        anchors.right: parent.right
        anchors.left: button1.right

        color: "red"
    }

    Rectangle {
        id: button1
        property bool on: true

        height: 100
        width: 30
        color: button1.on ? "grey" : "#2d2d2d"
        border.width: 1
        border.color: "black"
        radius: 2
        x: background.border.width
        y: background.border.width

        anchors.top: parent.right
        anchors.topMargin: background.border.width

        onXChanged: { eventWindow1.width = button1.x }

        Text
        {
            id: label
            anchors.fill: parent
            text: button1.on ? onText : offText
            font.family: "OpenSymbol"
            font.pixelSize: 27
            font.bold: true
            color: button1.on ? "#2d2d2d" : "grey"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment:  Text.AlignVCenter
            rotation: -90
        }

        MouseArea {
            id: bla
            anchors.fill: parent
            drag.target: parent
            drag.axis: Drag.XAxis
            drag.minimumX: background.border.width
            drag.maximumX: background.width - button1.width - background.border.width

            onClicked: {
                if(slideSwitch.state=="on")
                    slideSwitch.state="off"
                else
                    slideSwitch.state="on"
            }

            onReleased: {
                if(button1.x > ((drag.maximumX) / 2)) {
                    slideSwitch.state = ""
                    slideSwitch.state = "off"
                    toggled(false)
                }
                else {
                    slideSwitch.state = ""
                    slideSwitch.state = "on"
                    toggled(true)
                }
            }
        }
    }

    // using states to differentiate between "on" and "off"
    states: [
        State {
            name: "off"
            PropertyChanges {
                target: button1
                x: background.width - button1.width - background.border.width
                on: false
            }
        },
        State {
            name: "on"
            PropertyChanges {
                target: button1
                x: background.border.width
                on: true
            }
        }
    ]

    transitions: Transition {
        NumberAnimation {
            properties: "x"
            duration: 400
            easing.type: Easing.OutQuad
        }
    }
}
