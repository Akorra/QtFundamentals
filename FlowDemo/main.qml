import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: flowId.implicitWidth
    height: flowId.implicitHeight
    title: qsTr("Flow Demo")

    //wraps content and adapts item position
    Flow{
        id: flowId
        width: parent.width
        height: parent.height

        //flow:Flow.TopToBottom
        //layoutDirection: Qt.RightToLeft

        spacing:20

        Rectangle{
            width:95; height:width
            color:"darkmagenta"
        }
        Rectangle{
            width:90; height:width
            color:"deepskyblue"
        }
        Rectangle{
            width:80; height:width
            color:"springgreen"
        }
        Rectangle{
            width:70; height:width
            color:"saddlebrown"
        }
        Rectangle{
            width:60; height:width
            color:"Coral"
        }
        Rectangle{
            width:50; height:width
            color:"dodgerblue"
        }
        Rectangle{
            width:40; height:width
            color:"magenta"
        }
    }
}
