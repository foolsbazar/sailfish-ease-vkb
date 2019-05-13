import QtQuick 2.0
import com.jolla.keyboard 1.0
import Sailfish.Silica 1.0
import ".."

Repeater{
    property bool showSeparator: true
    anchors.fill: parent
    property var angles: []
    delegate: Repeater {
        model: angles
        delegate: Image {
            visible: showSeparator
            source: "../graphic-keyboard-highlight-top.png"
            anchors.right: horizontal==="right" ? parent.right : undefined
            anchors.left: horizontal==="left" ? parent.left : undefined
            anchors.top: vertical==="top" ? parent.top : parent.bottom
            transform: Rotation{origin.x: width/2; origin.y: 0; angle: modelData}
            // should scale based on pixel density
            width: geometry.scaleRatio >= 2 ? 2 : 1
            height: parent.height
            fillMode: Image.TileHorizontally// Math.abs(angles/90) === 1 ? Image.TileVertically :
        }
    }
}
