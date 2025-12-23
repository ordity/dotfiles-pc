import Quickshell.Services.SystemTray
import QtQuick

Repeater {
    id: sysTrayIcons

    model: SystemTray.items

    Item {
        id: singleImage
        height: parent.height
        width: 20

        Image {
            source: modelData.icon
            
            anchors {
                verticalCenter:  parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }

            sourceSize {
                width: 20
                height: 20
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    (mouse.button == Qt.LeftButton)
                    ? modelData.activate()
                    : modelData.secondaryActivate()
                }
            }
        }
    }
}

