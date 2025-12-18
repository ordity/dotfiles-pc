import Quickshell
import Quickshell.Io
import QtQuick

// TODO: on hover show more info

Item {
    id: root

    implicitWidth: memText.contentWidth
    height: parent.height

    required property color color
    required property font font

    property int memUsage: 0

    Process {
        id: memProc
        command: ["sh", "-c", "free | grep Mem"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var parts = data.trim().split(/\s+/)
                var total = parseInt(parts[1]) || 1
                var used = parseInt(parts[2]) || 0
                memUsage = Math.round(100 * used / total)
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            mem.memProc.running = true
        }
    }

    Text {
        id: memText
        anchors.verticalCenter: parent.verticalCenter
        color: parent.color
        font: parent.font

        text: " " + memUsage + "%"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: { parent.font.bold = true }
            onExited: { parent.font.bold = false }
        }
    }
}
