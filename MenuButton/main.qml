import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Drawer {
        id: drawer
        width: 0.66 * window.width
        height: window.height
        x: 50
        edge: Qt.RightEdge

        Text {
            text: "Menu area"
            anchors.centerIn: parent
        }
        z:10
    }

    Label {
        id: content

        text: "Pull from\nright edge"
        font.pixelSize: 96
        anchors.fill: parent
        verticalAlignment: Label.AlignVCenter
        horizontalAlignment: Label.AlignHCenter

        transform: Translate {
            x: (window.width - drawer.position * drawer.width - content.width) / 2
        }
    }

    StepMenuButton{
        id: menu
        anchors.top: parent.top
        anchors.topMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        z: 99

        parent: drawer.parent.parent
        step: drawer.position * 100

        onClicked: {
            if(drawer.position === 1)
                drawer.close()
            else
                drawer.open()
        }
    }
}
