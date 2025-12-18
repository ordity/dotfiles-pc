import Quickshell.Hyprland
import QtQuick

Item {
    id: root

    implicitWidth: submapText.contentWidth + 24

    property color bgColor
    property color fgColor
    property font font

    property bool isActive: false

    Connections {
        target: Hyprland
        enabled: true

        function onRawEvent(event) {
            if (event.name == "submap") {
                submapText.text = event.data
                root.isActive = (event.data !== "")
            }
        }
    }

    Rectangle {
        id: submapBg
        anchors.verticalCenter: parent.verticalCenter

        width: parent.width
        height: 20
        color: root.isActive ? root.bgColor : "#00000000"
    }

    Text {
        id: submapText
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color: root.fgColor
        font: parent.font


        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            
            onEntered: { parent.font.bold = true }
            onExited: { parent.font.bold = false }
        }

    }
}
