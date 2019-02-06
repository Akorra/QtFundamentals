import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("User Input Demo (Drag&Drop)")

    function setColorByX(x)
    {
        var MAX=256
        var exp = Math.floor(x/MAX)
        var mult = Math.pow(256,exp)
        var operand = Math.floor(x%MAX)
        var result = '#' + (operand*mult + 0xaa0000).toString(16)
        print(x, exp, mult, operand, result)
        return result
    }

    Rectangle {
        id:containerId
        width:600
        height:200
        Rectangle{
            id:dragRectId
            width:50; height:width
            color: setColorByX(x)
            MouseArea{
                anchors.fill:parent
                drag.target:dragRectId
                drag.axis: Drag.XAxis
                drag.minimumX: 0
                drag.maximumX: containerId.width - dragRectId.width
            }
        }
    }
}
