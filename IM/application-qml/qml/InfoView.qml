import QtQuick 2.0

Item {
    id: root

    property bool isShown: false

    anchors.fill: parent

    QtObject {
        id: priv
        property bool poleOut: false
        // How curly the curtain is when opened
        property int endCurly: 80
        // 0 = pole in, 1 = pole out
        property real polePosition: 0
        property bool showingStarted: false
    }

    function show() {
        priv.showingStarted = true;
        isShown = true;
        hideCurtainAnimation.stop();
        hidePoleAnimation.stop();
        if (priv.poleOut) {
            showCurtainAnimation.restart();
        } else {
            showPoleAnimation.restart();
        }
    }
    function hide() {
        priv.showingStarted = false;
        showCurtainAnimation.stop();
        showPoleAnimation.stop();
        if (priv.poleOut) {
            hideCurtainAnimation.restart();
        } else {
            hidePoleAnimation.restart();
        }
    }

    Binding {
        target: mainView
        property: "blurAmount"
        value: 40 * priv.polePosition
        when: root.isShown
    }

    // Pole show/hide animations
    SequentialAnimation {
        id: showPoleAnimation
        NumberAnimation { target: priv; property: "polePosition"; to: 1; duration: 600; easing.type: Easing.InOutQuad }
        PropertyAction { target: priv; property: "poleOut"; value: true }
        ScriptAction { script: showCurtainAnimation.restart(); }
    }
    SequentialAnimation {
        id: hidePoleAnimation
        PropertyAction { target: priv; property: "poleOut"; value: false }
        NumberAnimation { target: priv; property: "polePosition"; to: 0; duration: 600; easing.type: Easing.InOutQuad }
        PropertyAction { target: root; property: "isShown"; value: false }
    }

    // Curtain show/hide animations
    SequentialAnimation {
        id: showCurtainAnimation
        NumberAnimation { target: viewItem; property: "height"; to: root.height-70; duration: 1200; easing.type: Easing.OutBack }
    }
    SequentialAnimation {
        id: hideCurtainAnimation
        NumberAnimation { target: viewItem; property: "height"; to: 0; duration: 600; easing.type: Easing.OutCirc }
        ScriptAction { script: hidePoleAnimation.restart(); }
    }

    MouseArea {
        anchors.fill: parent
        enabled: root.isShown
        onClicked: {
            root.hide();
//            visTimer.restart()
        }
    }

    BorderImage {
        anchors.right: parent.right
        anchors.rightMargin: -10
        anchors.top: parent.top
        anchors.topMargin: -6
        border.left: 22
        border.right: 64
        border.top: 0
        border.bottom: 0
        width: 86 + priv.polePosition * (viewItem.width-88)
        z: 20
        source: "images/info.png"
        opacity: 0.5 + priv.polePosition
        scale: 0.6
        MouseArea {
            anchors.fill: parent
            anchors.margins: -20
            onClicked: {
//                visTimer.restart()
                if (priv.showingStarted) {
                    root.hide();
                } else {
                    root.show();
                }
            }
        }
    } // BorderImage

    Item {
        id: viewItem
        anchors.right: parent.right
        width: parent.width //Math.min(620, parent.width)
        y: 8
        visible: isShown

        Rectangle {
            id: backgroundItem
            anchors.fill: parent
            anchors.margins: 16
            anchors.topMargin: 8
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#101010" }
                GradientStop { position: 0.3; color: "#404040" }
                GradientStop { position: 1.0; color: "#090909" }
            }
            border.color: "#808080"
            border.width: 1
            opacity: 0.8
        }

        Flickable {
            id: flickableArea
            anchors.fill: backgroundItem
            contentHeight: infoTextColumn.height + 32
            contentWidth: backgroundItem.width
            flickableDirection: Flickable.VerticalFlick
            clip: true

            Column {
                id: infoTextColumn
                width: parent.width
                spacing: 32

                Text {
                    id: textItem
//                    anchors.left: parent.left
//                    anchors.leftMargin: 14
//                    anchors.top: parent.top
//                    anchors.topMargin: 14
                    height: 60
                    color: "#ffffff"
                    font.family: "OpenSymbol"
                    font.pixelSize: 27
                    text: "<u>Events</u>"
                    verticalAlignment: Text.AlignBottom
                }

                Text {
                    id: bla
//                    anchors.left: parent.left
//                    anchors.leftMargin: 14
//                    anchors.top: parent.top
//                    anchors.topMargin: 14
                    height: 60
                    color: "#ffffff"
                    font.family: "OpenSymbol"
                    font.pixelSize: 27
                    text: "<u>Events</u>"
                    verticalAlignment: Text.AlignBottom
                }

//                InfoViewItem {
//                    id: entryItem
//                    text: "Welcome to <i>'bbv GUI Showcase'</i> demo. This application demonstrates the power of Qt5 and the interaction between the ARM core and the DSP. Below is a short summary of the hardware and software features which have been used in this demo application."
//                    image: "../images/Qt.png"

//                }

//                HardwareView{
//                    id: hwView
//                    anchors.top: entryItem.bottom
//                    anchors.left: parent.left
//                }

//                SoftwareView{

//                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    horizontalAlignment: Text.AlignHCenter
                    color: "#909090"
                    font.pixelSize: 0
                    text: "Copyright 2013 bbv. Reuse sources freely."
                }
            } // infoTextColumn
        } // flickableArea
    } // itemView
}
