import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Easing Demo")
    color :"white"

    property int stopHeight : height - basketballId.height
    property int stopWidth : width - basketballId.width
    property int animDurationMs : 2000


    Image{
        id : basketballId
        source : "BBall_Tiny.png"

        NumberAnimation on y {
            duration : animDurationMs
            to : stopHeight
            easing.type : Easing.OutBounce
            easing.amplitude: 2.5
        }

        NumberAnimation on rotation {
            to:360
            duration:animDurationMs
        }

        NumberAnimation on x {
            to : stopWidth
            duration : animDurationMs
            easing.type : Easing.InSine
        }
    }

//    property int borderWidth : 2
//    property int borderRelief : 2* borderWidth

//    Rectangle{
//        width : 600
//        height : 400
//        border.color: "black"
//        border.width : borderWidth
//        Rectangle{
//            width : parent.width - borderRelief
//            height : 0
//            anchors{
//                bottom : parent.bottom
//                bottomMargin: borderWidth
//                left : parent.left
//                leftMargin: borderWidth
//            }
//            color : "firebrick"

//            NumberAnimation on height {
//                duration : 3000
//                to : 400-borderRelief
//                easing.type : Easing.OutInCubic
//            }

//        }
//    }

}
