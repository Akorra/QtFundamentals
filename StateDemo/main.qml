import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("States Demo")

    property int moonRise : 17
    property int moonSet : -30
    property int sunRise : -10
    property int sunSet : 350
    property color daytimeTop : "#3b72bd"
    property color daytimeBottom: "#a3deff"
    property color nightTop :"#192324"
    property color nightBottom: "#717274"
    property color sunriseTop: "#7F859D"
    property color sunriseBottom: "#FFFDC6"
    property color sunsetTop: "#F9F144"
    property color sunsetBottom:"#7E5484"

    Rectangle {
        id : moonId
        x: 307
        y: moonRise
        width : 50 ; height :width
        radius: width/2
        z:1
    }

    Image {
        id : sunId
        x: 275
        y:sunSet
        width: 114; height : width
        source : "Sun.png"
        z:1
    }

    Rectangle{
        id :sceneId
        focus : true
        width : 400 ; height : width
        gradient: Gradient {
            GradientStop{id : topColorId
                position : 0.0
                color : nightTop}
            GradientStop{ id : bottomColorId
                position : 1.0
                color : nightBottom}

            }

        Behavior on color {
            ColorAnimation{ duration : 1000}}

        Image {
            id : owlAsleepId
            source : "OwlAsleep.png"
            anchors.centerIn: parent
            opacity : 0
        }
        Image {
            id : owlAwakeId
            source :"OwlAwake.png"
            anchors.centerIn: parent
            opacity : 0
        }

        Image {
            id : owlDrowsyId
            source :"OwlDrowsy.png"
            anchors.centerIn: parent
            opacity : 0
        }

        states: [
            State{
                name : "Asleep"
                when : !mouseAreaId.containsMouse
                //                PropertyChanges {target : sceneId
                //                    color :day}
                PropertyChanges {
                    target: topColorId
                    color : daytimeTop }
                PropertyChanges{
                    target :bottomColorId
                    color :daytimeBottom}
                PropertyChanges {target : moonId
                    y: moonSet
                    opacity : 0}
                PropertyChanges {target :sunId
                    opacity: 1
                    y: sunRise}
                PropertyChanges {target :owlAwakeId
                    opacity: 0}
                PropertyChanges {target :owlAsleepId
                    opacity : 1}
            },
            State{
                name: "Awake"
                when : mouseAreaId.containsMouse
                //                PropertyChanges {target : sceneId
                //                    color :night}
                PropertyChanges {
                    target: topColorId
                    color : nightTop }
                PropertyChanges{
                    target :bottomColorId
                    color :nightBottom}
                PropertyChanges {target : moonId
                    y:moonRise
                    opacity : 1}
                PropertyChanges {target :sunId
                    opacity: 0
                    y : sunSet}
                PropertyChanges {target :owlAwakeId
                    opacity: 1}
                PropertyChanges {target :owlAsleepId
                    opacity: 0}
            },
            State {
                name : "Awaking"
                extend : "Asleep"
                PropertyChanges {target :owlDrowsyId
                    opacity: 1}
                PropertyChanges {target :owlAsleepId
                    opacity : 0}
                PropertyChanges {target :sunId
                    y : sunSet/2}
                PropertyChanges {target : topColorId
                    color : sunsetTop}
                PropertyChanges {target :bottomColorId
                    color :sunsetBottom}
            },
            State {
                name : "DosingOff"
                 extend : "Awake"
                PropertyChanges {target :owlDrowsyId
                    opacity: 1}
                PropertyChanges {target :owlAsleepId
                    opacity : 0}
                PropertyChanges {target :sunId
                    y : sunSet
                    opacity: .2}
                PropertyChanges {target : topColorId
                    color : sunriseTop}
                PropertyChanges {target :bottomColorId
                    color :sunriseBottom}
            }

        ]

        MouseArea{
            id : mouseAreaId
            anchors.fill: parent
            hoverEnabled: true
        }

        Keys.onDigit1Pressed: {
            if (sceneId.state === "Awake")
                sceneId.state = "DosingOff"
            else if (sceneId.state == "Asleep")
                sceneId.state = "Awaking"
        }

        transitions: Transition{
            ColorAnimation {duration: 1000 }
            NumberAnimation{
                properties : "y, opacity"
                duration : 1000
                easing.type : Easing.InSine
            }
        }

    }
}
