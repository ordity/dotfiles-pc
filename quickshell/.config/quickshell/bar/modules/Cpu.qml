import Quickshell.Io
import QtQuick

// TODO: on hover show either termals or per-core info

Item {
    id: root
    
    implicitWidth: cpuText.width
    height: parent.height

    property color color
    property font font

    property int cpuUsage: 0
    property var lastCpuIdle: 0
    property var lastCpuTotal: 0
    Process {
        id: cpuProc
        command: ["sh", "-c", "head -1 /proc/stat"]
        stdout: SplitParser {
            onRead: data => {
                if (!data) return
                var p = data.trim().split(/\s+/)
                var idle = parseInt(p[4]) + parseInt(p[5])
                var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
                if (root.lastCpuTotal > 0) {
                    root.cpuUsage = Math.round(
                        100 * (1 - (idle - root.lastCpuIdle) / (total - root.lastCpuTotal))
                    )
                }
                root.lastCpuTotal = total
                root.lastCpuIdle = idle
            }
        }
        Component.onCompleted: running = true
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        onTriggered: {
            cpuProc.running = true
        }
    }

    Text {
        id: cpuText
        anchors.verticalCenter: parent.verticalCenter

        text: " " + root.cpuUsage + "%"
        color: parent.color
        font: parent.font

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true

            onEntered: { parent.font.bold = true }
            onExited: { parent.font.bold = false }
        }
    }
}
