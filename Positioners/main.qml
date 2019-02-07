import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Positioners Demo")

    Rectangle{
        id: rootId
        width:150; height:width
        border.color:"black"
        Grid{
            columns: 3
            rowSpacing: 30
            spacing: 10
            LayoutMirroring.enabled: true
            LayoutMirroring.childrenInherit:
            Rect50{
                color: "lightgreen"
                Image{
                    source: "Flower.jpg"
                    width:48; height:48
                }
            }

            Rect50{
                color:"paleturquoise"
            }

            Rect50{
                color:"thistle"
            }

            Rect50{
                color:"seagreen"
            }

            Rect50{
                id:sibId
                color: "mediumturquoise"
            }

            Rect50{
                color:"violet"
            }

            Rect50{
                color:"darkgreen"
            }

            Rect50{
                color:"darkturquoise"
            }

            Rect50{
                color:"darkviolet"
            }
        }
    }
}
