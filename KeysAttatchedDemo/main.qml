import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("User Input Demo [Keys Attatched]")

    function setColorByX(x)
    {
        var MAX=256
        var exp = Math.floor(x/MAX)
        var mult = Math.pow(256,exp)
        var operand = Math.floor(x%MAX)
        var result = '#' + (operand*mult + 0xaa0000).toString(16)
        //print(x, exp, mult, operand, result)
        return result
    }

    Rectangle {
        id:containerId
        width:600
        height:200
        Rectangle{
            id:dragRectId
            function checkKey(myEvent){
                if(myEvent.key === Qt.Key_2){
                    print("Detected Key 2")
                }else if(myEvent.key === Qt.Key_Control){
                    print('.')
                }else{
                    print("Detected Key: " + myEvent.key) //myEvent.key return the ascii value of the pressed key
                }
            }
            width:50; height:width
            color: setColorByX(x)
            MouseArea{
                anchors.fill:parent
                drag.target:dragRectId
                drag.axis: Drag.XAxis
                drag.minimumX: 0
                drag.maximumX: containerId.width - dragRectId.width
            }
            Keys.onDigit0Pressed: radius = 0
            Keys.onDigit1Pressed: radius = 25
            Keys.onPressed: checkKey(event)
            Keys.onDigit2Pressed: {print("onDigit2Pressed"); event.accepted=false} // direct handler gets priority event.accepted set to flase allows both direct handler and indirect handler in checkKey function
            Keys.onDigit3Pressed: if(event.modifiers === Qt.ControlModifier) print("CTRL+3 Detected") //in mac ctrl == cmd
            focus: true
        }
    }
}
