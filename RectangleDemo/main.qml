import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Rectangle")

    Item {
        anchors.centerIn: parent
        Rectangle {
            id:firstRectId
            width:200
            height:50
            color:"#ff0000"
            z:1 //default 0
        }
        Rectangle {
            width:firstRectId.width/4
            height:firstRectId.height
            radius:25
            border.width:2
            border.color:"green"
            gradient: Gradient {
                GradientStop {
                    position: 0.00;
                    color: "#c7e4f5";
                }
                GradientStop {
                    position: 0.52;
                    color: "#ffffff";
                }
                GradientStop {
                    position: 1.00;
                    color: "#1c7bff";
                }
            }
            //opacity:.5
            //anchors.left:firstRectId
            //anchors.fill:firstRectId
            //anchors.leftMargin: -15 //overlap
            visible:true //visible wins over opacity
            anchors.centerIn: firstRectId
            anchors.verticalCenterOffset: 15
        }
    }
}
