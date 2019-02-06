import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Anchors Demo")

    Rectangle{
        id:rootId
        width:150
        height:width
        border.color:"black"

        Rect50{
            id:sibId
            //anchors.verticalCenter: parent.verticalCenter
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.centerIn: parent
            //offsets applied to this element will not only offset this elememnt but all elements anchored to it in the direction of the offset
            color: "mediumturquoise"
        }

        Rect50{
            color: "lightgreen"
        }

        Rect50{
            anchors.left:sibId.left
            color:"paleturquoise"
        }

        Rect50{
            anchors.left:sibId.right
            //can only set left margin since theres only a left anchor
            color:"thistle"
        }

        Rect50{
            anchors.top:sibId.top
            color:"seagreen"
        }

        Rect50{
            anchors.top:sibId.top
            anchors.right:parent.right
            color:"violet"
        }

        Item{
            width: parent.width
            height:50
            anchors.top:sibId.bottom
            Rect50{
                color:"darkgreen"
            }
            Rect50{
                anchors.centerIn:parent
                color:"darkturquoise"
            }
            Rect50{
                anchors.right:parent.right
                color:"darkviolet"
            }
        }
    }
}
