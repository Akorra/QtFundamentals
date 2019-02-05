import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem{
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    Image{
        source: "qrc:images/BlueBullet.png"
        //fillMode: Image.TileVertically
        fillMode: Image.Pad
        horizontalAlignment: Image.AlignRight
        height:800
    }
    Image{
        y:100
        x:50
        mirror:true
        source: "file:DoneReturn.png"
    }
    Image{
        source: "http://s.pluralsight.com/mn/img/sh/logo-v6.png"
    }
}
