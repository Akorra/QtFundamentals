import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Transform Demo")

    Text{
        text: "transform:Rotation"
        font.family: "BitStream-Vera-Sans"
        font.pointSize: 24
        anchors.centerIn: parent
    }
    Text{
        text: "transform:Rotation"
        font.family: "BitStream-Vera-Sans"
        font.pointSize: 24
        rotation: 45
        anchors.centerIn: parent
    }

    Text{
        text: "transform:Rotation"
        font.family: "BitStream-Vera-Sans"
        font.pointSize: 24
        anchors.centerIn: parent
        color:"red"
        transform: Rotation{
            //rotation origin defaults to (0,0)
            origin.x: 212
            origin.y: 16
            angle: 45
            axis {x:1; y:1; z:1} //rotation around all axis
        }
    }

    //image rotated only around y axis
    Image{
        source:"Puzzle.jpg"
        transform: Rotation{
            origin.x : 130
            origin.y : 130
            origin {x:0;y:1;z:0}
            angle:45
        }
    }

    Rectangle{
        width:200; height:100
        border.color: "black"
    }

    Rectangle{
        id: rectId
        width:200; height:100
        border.color: "red"
        border.width: 2
        transform: Scale{
            xScale: .5
            yScale: .5
            //origin.x: rectId.width/2
            //origin.y: rectId.height/2
        }
    }

    Row{
        y:300
        Rectangle{
            width:100; height:100
            color: "green"
        }
        Rectangle{
            id:redId
            width:100; height:100
            color:"red"
            x:-20
            y:-20
            transform: Translate{ x:-20; y:-20 }
        }
        Rectangle{
            width:100; height:100
            color: "blue"
        }
    }

}
