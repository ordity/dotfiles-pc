import Quickshell
import Quickshell.Hyprland
import QtQuick

Item {
    id: root
    height: parent.height
    implicitWidth: rect.width

    property HyprlandWorkspace workspace: modelData

    property color colorActive
    property color colorInactive
    property color colorLine
    property color colorMuted
    property color colorSpecial

    property font font

    readonly property bool isActive: (
        Hyprland.focusedWorkspace?.id === workspace.id
    )
    readonly property bool isSpecial: (
        workspace.name == "special:magic"
    )
    property bool isSpecialFocused: false

    Connections {
        target: Hyprland
        enabled: true
        function onRawEvent(event) {
            if (event.name == "activespecialv2") {
                if (event.parse(3)[0]) {
                    root.isSpecialFocused = true
                } else {
                    root.isSpecialFocused = false
                }
            }
        }
    }

    Item {
        id: rect
        height: parent.height
        width: root.isSpecial ? 16 : 32

        Rectangle {
            id: underline
            height: 8
            width: parent.width
            radius: 4
            color: "#00000000"
            anchors {
                verticalCenter: parent.top
                horizontalCenter: parent.horizontalCenter
            }
        }

        Rectangle {
            id: ws_bar
            height: root.isSpecial ? 12 : 8
            width: root.isSpecial ? 12 : 24
            radius: 4
            color: root.isSpecial
            ? (root.isSpecialFocused ? root.colorSpecial : root.colorMuted)
            : (root.isSpecialFocused ? root.colorMuted : (root.isActive ? root.colorActive : root.colorInactive))
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            
        }

        Item {
            id: mouseInteraction
            height: parent.height
            width: parent.width
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    root.isSpecial
                    ? Hyprland.dispatch("workspace special:magic")
                    : Hyprland.dispatch("workspace " + root.workspace.id)
                }
                onEntered: {
                    underline.color = root.colorLine
                }
                onExited:  {
                    underline.color = "#00000000"
                }
            }
        }
        /*
        Text {
            id: ws_text
            anchors.fill: parent
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 6
    
            text: isSpecial ? "" : (isActive ? " " : " ")
            color: isActive ? root.colorActive : root.colorInactive
            font: root.font

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
    
                cursorShape: Qt.PointingHandCursor
                onClicked: Hyprland.dispatch(
                    "workspace " + workspace.id
                )
                onEntered: {
                    underline.color = root.colorUnderline
                }
                onExited:  {
                    underline.color = "#00000000"
                }
            }
        }
        */
    }
}
