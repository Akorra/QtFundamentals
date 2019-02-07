import QtQuick 2.9
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    color :"white"

    property int fillTime : 2250
    property int onOffTime : 250

    Image{
        source: "empty.jpg"
        y:10
        x: 25
    }
    Image{
        id :streamId
        source:"stream.jpg"
        x: 145
        opacity : 0
    }

    Image{
        id: waterId
        source: "water.jpg"
        x:138
        y:280
        height: 0
    }
    Image {
        id : fullGlassId
        source :"fullGlass.jpg"
        x:110
        y:325
        opacity : 0
    }
    Rectangle {
        color: "#606060"
        x:140
        y:325
        width:30
        height:1
    }

    SequentialAnimation
    {
        id : animId
        //Grow Stream Height
        NumberAnimation {
            target : streamId
            property : "height"
            from : 0 ;to : 275
            duration:onOffTime
        }
        ParallelAnimation{ //Glass Fills
            NumberAnimation {
                target : waterId
                property : "height"
                from : 0 ;to : 71
                duration:fillTime}

            NumberAnimation {
                target : waterId
                property : "y"
                from :415
                to : 345;
                duration: fillTime
            }
            //Stream Height Shortens
            NumberAnimation {
                target : streamId
                property : "height"
                from: 275
                to : 200
                duration:fillTime
            }
        }

        ParallelAnimation{ //Water Turns Off
            NumberAnimation {
                target : streamId
                property : "height"
                from: 200
                to : 0
                duration:onOffTime
                easing.type: Easing.InCubic
            }

            NumberAnimation{
                target: streamId
                property:  "y"
                from: 155
                to : 355
                duration : onOffTime
                easing.type : Easing.InCubic
            }
        }
        //Show Full Glass
        NumberAnimation {
            target : fullGlassId
            property : "opacity"
            to : 1
            duration : 1
        }

    }


    MouseArea{
        anchors.fill: parent
        onClicked :{
            fullGlassId.opacity = 0
            streamId.height = 0
            streamId.y = 155
            streamId.opacity =1
            waterId.height = 0
            waterId.opacity =1
            animId.start()

        }
    }
}
