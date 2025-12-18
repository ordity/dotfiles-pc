pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts
import QtQml

import "modules"

// TODO: Systray, Powermenu


PanelWindow {
    id: root

    required property Colors colors
    required property font defaultFont
    required property int barHeight

    implicitHeight: root.barHeight
    color: root.colors.cBg
    anchors {
        top: true
        left: true
        right: true
    }

    component Separator: Rectangle {
        width: 1; height: 16; color: root.colors.e3
    }

    component Spacer: Item { Layout.fillWidth: true }

    RowLayout {
        id: bar
        spacing: 8

        anchors {
            fill: parent
            leftMargin: 4.0
            rightMargin: 8.0
        }

        HyWorkspaces {
            id: hyprlandWorkspaces
            colorActive: root.colors.cA2
            colorInactive: root.colors.cFg
            colorLine: root.colors.c12
            colorSpecial: root.colors.c2
            colorMuted: root.colors.c8
        }

        HySubmap {
            id: submap
            bgColor: root.colors.c13
            fgColor: root.colors.cFg
            font: root.defaultFont
            anchors.verticalCenter: parent.verticalCenter
        }

        Spacer {}

        // // MIDDLE SIDE
        
        Text {
            id: windowTitle
            text: Hyprland.activeToplevel?.title
            color: root.colors.cFg
            font: root.defaultFont
            anchors.horizontalCenter: parent.horizontalCenter
        }
        
        /*
        HyDebug {
            color: root.colors.c1
            font: root.defaultFont
            anchors.verticalCenter: parent.verticalCenter
        }
        */

        Spacer {}

        // // RIGHT SIDE
        
        Separator {}

        Volume {
            id: volume
            color: root.colors.c3
            font: root.defaultFont
            anchors.verticalCenter: parent.verticalCenter
        }

        Separator {}

        Cpu {
            id: cpu
            color: root.colors.c6
            font: root.defaultFont
            anchors.verticalCenter: parent.verticalCenter
        }

        Separator {}

        Memory {
            id: mem
            color: root.colors.c10
            font: root.defaultFont
            anchors.verticalCenter: parent.verticalCenter
        }

        Separator {}

        Clock {
            id: clock
            color: root.colors.c5
            font: root.defaultFont
            anchors.verticalCenter: parent.verticalCenter
            anchors.rightMargin: 8.0
        }
    }
}
