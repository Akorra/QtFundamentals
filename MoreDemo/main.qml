import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

Window {
    visible: true
    width: Screen.width/4
    height: Screen.width/4
    title: qsTr("Demo More DAH:" + Screen.desktopAvailableHeight + "DAW:" + Screen.desktopAvailableWidth)

    AnimatedImage{
        id:gifId
        source:"Upload.gif"
        x: (currentFrame/frameCount)*width
        y:50
    }

    /*
    Rectangle{
        color:"black"
        width:631
        height:413
        x:29
        y:29
        anchors.topMargin: 20
    }

    BorderImage {
        id: picFrameId
        z:1
        source: "Frame.png"
        height:480
        width:480
        horizontalTileMode: BorderImage.Stretch
        verticalTileMode: BorderImage.Stretch
        border{
            left: 120
            top: 120
            right: 275
            bottom: 395
        }
    }
    */
}
