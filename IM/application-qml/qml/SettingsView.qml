import QtQuick 2.0

Item {
    id: root

    property bool isShown: false

    anchors.fill: parent

    function show() {
        isShown = true;
        hideAnimation.stop();
        showAnimation.restart();
    }
    function hide() {
        isShown = false;
        showAnimation.stop();
        hideAnimation.restart();
    }

    SequentialAnimation {
        id: showAnimation
        PropertyAction { target: backgroundItem; property: "visible"; value: true }
        ParallelAnimation {
            NumberAnimation { target: backgroundItem; property: "opacity"; to: 1; duration: 250; easing.type: Easing.InOutQuad }
            NumberAnimation { target: backgroundItem; property: "scale"; to: 1; duration: 500; easing.type: Easing.OutBack }
        }
    }
    SequentialAnimation {
        id: hideAnimation
        ParallelAnimation {
            NumberAnimation { target: backgroundItem; property: "opacity"; to: 0; duration: 500; easing.type: Easing.InOutQuad }
            NumberAnimation { target: backgroundItem; property: "scale"; to: 0.6; duration: 500; easing.type: Easing.InOutQuad }
        }
        PropertyAction { target: backgroundItem; property: "visible"; value: false }
    }

    MouseArea {
        anchors.fill: parent
        enabled: root.isShown
        onClicked: {
            root.hide();
        }
    }

    Image {
        id: settingsIcon
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 4
        source: "images/settings.png"
        opacity: backgroundItem.opacity + 0.4
        MouseArea {
            anchors.fill: parent
            anchors.margins: -20
            onClicked: {
                if (root.isShown) {
                    root.hide();
                } else {
                    root.show();
                }
            }
        }
    }

    BorderImage {
        id: backgroundItem
        anchors.left: settingsIcon.horizontalCenter
        anchors.bottom: settingsIcon.verticalCenter
        width: Math.min(550, parent.width - 60)
        height: settingsContentColumn.height + 36
        source: "images/panel_bg.png"
        border.left : 10
        border.right : 10
        border.top : 5
        border.bottom : 26

        transformOrigin: Item.BottomLeft
        visible: false
        opacity: 0
        scale: 0.6

        Column {
            id: settingsContentColumn
            width: parent.width -50
            x:25
            y: 8

            Text{
                id: nickText
                text:"Nickname:"
                anchors.left: parent.left
                anchors.leftMargin: 10
                color: "white"
                font.family: "OpenSymbol"

            }
            TextInput{
                anchors.left: nickText.right
                anchors.leftMargin: 5
            }

            // Exposure min=1 max=1048575 step=1 default=1943 value=56
//            Slider
//            {
//                height: 60
//                width: settingsContentColumn.width
//                minimum: 1
//                value: 766
//                maximum: 15000
//                bgColor: "red"
//                objectName: "slider_exposure"
//                anchors.horizontalCenter: parent.horizontalCenter
//            }
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - 32
                height: 1
                color: "#404040"
            }

            //-------------------------------------------------
//            Text{
//                text:"Gain Red:"
//                anchors.left: parent.left
//                anchors.leftMargin: 10
//                color: "white"
//                font.family: "OpenSymbol"
//            }
//            // Gain min=8 max=1024 step=1 default=8 value=16
////            Slider
////            {
////                height: 60
////                width: parent.width
////                minimum: 8
////                value: 32
////                maximum: 255
////                objectName: "slider_gain_red"
////            }
//            Rectangle {
//                anchors.horizontalCenter: parent.horizontalCenter
//                width: parent.width - 32
//                height: 1
//                color: "#404040"
//            }

//            //-------------------------------------------------
//            Text{
//                text:"Gain Green:"
//                anchors.left: parent.left
//                anchors.leftMargin: 10
//                color: "white"
//                font.family: "OpenSymbol"
//            }
//            // Gain min=8 max=1024 step=1 default=8 value=16
////            Slider
////            {
////                height: 60
////                width: parent.width
////                minimum: 8
////                value: 32*(3/4)
////                maximum: 255
////                objectName: "slider_gain_green"
////            }
//            Rectangle {
//                anchors.horizontalCenter: parent.horizontalCenter
//                width: parent.width - 32
//                height: 1
//                color: "#404040"
//            }

//            //-------------------------------------------------
//            Text{
//                text:"Gain Blue:"
//                anchors.left: parent.left
//                anchors.leftMargin: 10
//                color: "white"
//                font.family: "OpenSymbol"
//            }
//            // Gain min=8 max=1024 step=1 default=8 value=16
////            Slider
////            {
////                height: 60
////                width: parent.width
////                minimum: 8
////                value: 32
////                maximum: 255
////                objectName: "slider_gain_blue"
////            }
//            Rectangle {
//                anchors.horizontalCenter: parent.horizontalCenter
//                width: parent.width - 32
//                height: 1
//                color: "#404040"
//            }

//            //-------------------------------------------------
//            Text{
//                text:"Brightness:"
//                anchors.left: parent.left
//                anchors.leftMargin: 10
//                color: "white"
//                font.family: "OpenSymbol"
//            }
//            // brightness (int)    : min=0 max=255 step=1 default=0 value=4 flags=slider
////            Slider
////            {
////                height: 60
////                width: parent.width
////                minimum: 0
////                value: 0
////                maximum: 255
////                objectName: "slider_brightness"
////            }
//            Rectangle {
//                anchors.horizontalCenter: parent.horizontalCenter
//                width: parent.width - 32
//                height: 1
//                color: "#404040"
//            }

//            //-------------------------------------------------
//            Text{
//                text:"Contrast:"
//                anchors.left: parent.left
//                anchors.leftMargin: 10
//                color: "white"
//                font.family: "OpenSymbol"
//            }
//            // contrast (int)    : min=0 max=255 step=1 default=16 value=64 flags=slider
////            Slider
////            {
////                height: 60
////                width: parent.width
////                minimum: 0
////                value: 16
////                maximum: 255
////                objectName: "slider_contrast"
////            }
//            Rectangle {
//                anchors.horizontalCenter: parent.horizontalCenter
//                width: parent.width - 32
//                height: 1
//                color: "#404040"
//            }

//            //-------------------------------------------------
//            Text{
//                text:"Test pattern:"
//                anchors.left: parent.left
//                anchors.leftMargin: 10
//                color: "white"
//                font.family: "OpenSymbol"
//            }
//            // Testpattern min=0 max=9 default=0 value=9
////            Slider
////            {
////                height: 60
////                width: parent.width
////                minimum: 0
////                value: 0
////                maximum: 9
////                objectName: "slider_testpattern"
////            }
        }
    }
}
