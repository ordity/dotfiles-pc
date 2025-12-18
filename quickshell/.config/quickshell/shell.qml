import Quickshell
import QtQuick
import "bar"
import "bar/modules"

ShellRoot {
    Bar {
        colors: Colors { cBg: "#99282828"; c13: "#99d3869b" }
        defaultFont: ({
            family: "JetBrainsMono Nerd Font",
            pixelSize: 16,
            bold: false
        })
        barHeight: 24
    }

    // TODO: List of ideas:
    // - Systray
    // - Clock:
    //   - show calendar on hover
    //   - right click to change timezone to Torronto time
    // - Cpu:
    //   - on hover, expand into a popup window with thermals and per-core info
    // - Hyprland:
    //   - make submaps prettier
    //   - when hovering over active submap indicator, show list of shortcuts
    //   - integrate the magic workspace
    //   - separate out the focues window title and make it prettier
    // - Memory:
    //   - on hover, expand into a popup with more information (total memory, precise usage etc.)
    // - Volume:
    //   - on right-click, create a popup window with most common controls
    // - Powermenu
    // - Experiment with making the bar look prettier
    // - Animations
}
