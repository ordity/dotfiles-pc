pragma ComponentBehavior: Unbound

import Quickshell.Hyprland
import QtQuick

Repeater {
    id: root

    property color colorActive
    property color colorInactive
    property color colorLine
    property color colorSpecial
    property color colorMuted

    model: Hyprland.workspaces.values

    HyWorkspace {
        workspace: modelData

        colorActive: root.colorActive
        colorInactive: root.colorInactive
        colorLine: root.colorLine
        colorSpecial: root.colorSpecial
        colorMuted: root.colorMuted
    }
}
