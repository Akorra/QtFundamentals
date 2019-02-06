import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    id:rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id:simpleDemoId
        width:50
        height:width
        color:"black"
        radius:5
        MouseArea {
            width:simpleDemoId.width; height:simpleDemoId.height
            //onClicked: parent.x ===0? parent.x=50:parent.x=0
            //onClicked: simpleDemoId.x = mouse.x //the mouse property is relative to the parent element (in this case window x=0 is mouse.x=0
            hoverEnabled: true
            onHoveredChanged: containsMouse ? simpleDemoId.color="teal" : simpleDemoId.color="red"
        }
    }

    MouseArea{
        width:rootId.width; height:rootId.height
        onClicked: {simpleDemoId.x = mouse.x-(simpleDemoId.height/2); simpleDemoId.y = mouse.y-(simpleDemoId.width/2)}
    }
    /*
      since parent element is root, mouse coordinates are relative to Window
    MouseArea {
        width:rootId.width; height:rootId.height
        //onClicked: parent.x ===0? parent.x=50:parent.x=0
        onClicked: simpleDemoId.x = mouse.x //the mouse property is relative to the parent element (in this case window x=0 is mouse.x=0
        hoverEnabled: true
        onHoveredChanged: containsMouse ? simpleDemoId.color="teal" : simpleDemoId.color="red"
    }
    */
}
