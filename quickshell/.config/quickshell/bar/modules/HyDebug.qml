import Quickshell
import Quickshell.Hyprland
import QtQuick

Item {
    id: root

    property color color
    property font font

    Connections {
        target: Hyprland
        enabled: true

        function onRawEvent(event) {
            // activespecialv2
            // activewindowv2
            if (event.name == "activespecialv2") {
                if (event.parse(3)[0]) {
                    debugText.text = "s"
                } else {
                    debugText.text  = "n"
                }
                //debugText.text = event.parse(3)[0]

            }
            // debugText.text = event.name + " " + event.data
        }
    }

    Text {
        id: debugText
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "h"
        color: root.color
        font: root.font
    }
}
