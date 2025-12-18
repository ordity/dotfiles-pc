import Quickshell
import Quickshell.Services.Pipewire
import QtQuick

Item {
    id: root

    implicitWidth: volText.contentWidth
    height: parent.height

    required property color color
    required property font font

    PwObjectTracker {
        objects: Pipewire.preferredDefaultAudioSink
    }

    Text {
        id: volText
        anchors.verticalCenter: parent.verticalCenter
        color: root.color
        font: root.font

        text: "  " + (Pipewire.preferredDefaultAudioSink.audio.volume * 100).toFixed(0) + "%"

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: Quickshell.execDetached("pavucontrol")
            onEntered: { parent.font.bold = true }
            onExited: { parent.font.bold = false }
        }
    }
}
