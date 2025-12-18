import QtQuick

Item {
    id: root

    height: parent.height
    
    implicitWidth: clockText.contentWidth

    property color color
    property font font

    property bool show_date: false

    function clock_output(): string {
        return root.show_date
        ? Qt.formatDateTime(new Date(), "ddd, dd.MM.yyyy")
        : Qt.formatDateTime(new Date(), "HH:mm")
    }

    Text {
        id: clockText
        anchors.verticalCenter: parent.verticalCenter

        color: root.color
        font: root.font
        text: root.clock_output()

        Timer {
            interval: 10000
            running: true
            repeat: true
            onTriggered: clockText.text = root.clock_output()
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor

            onClicked: {
                root.show_date = (root.show_date === false)
                clockText.text = root.clock_output()
            }
            onEntered: { clockText.font.bold = true }
            onExited: { clockText.font.bold = false }
        }
    }
}
