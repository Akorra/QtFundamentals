import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property string biohazard: "\u2623"
    property string bullet32: "<img src='BlueBullet.png' width='32' height='32' />"
    Text{
        id: upperTextId
        x:20
        y:20
        text: qsTr("\u2622 A demonstartion of <b>TEXT</b> properties. %0".arg(biohazard))
        textFormat: Text.StyledText
        style:Text.Outline
        styleColor:"green"
        //elide:Text.ElideRight
        width: 100
        font{
            family: "arial unicode ms"
            italic:true
            pointSize:24
            //bold:true or weight: Font.Black or html tags in text <b>
        }
        color: "#A00"
    }
    Text {
        id:lowerTextId
        text: "%0this is a bullet.".arg(bullet32)
        anchors.top:upperTextId.bottom
        font{
            family: "adobe caslon pro bold"
            pointSize: 12
        }
    }
}
