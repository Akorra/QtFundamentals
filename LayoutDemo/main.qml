import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: rootId
    visible: true
    width: layoutId.implicitWidth
    height: layoutId.implicitHeight
    title: qsTr("Layout Demo")

    GridLayout{
        id: layoutId
        width: parent.width
        height: parent.height/2
        columns: 5
        //flow: GridLayout.TopToBottom // changes layout direction

        Rectangle{
            width:95; height:width
            color:"darkmagenta"
        }

        Rectangle{
            width:90; height:width
            color:"deepskyblue"
        }

        Rectangle{
            //width:80; height:width
            color:"springgreen"
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredWidth: 80
            Layout.preferredHeight: layoutId.implicitHeight
            Layout.columnSpan: 2 //ocupies 2 columns
            Layout.column: 0 //this rect will be on the first column and overrides the previous ones
            Layout.minimumWidth: 25
            Layout.maximumWidth: 400
        }

        Rectangle{
            width:70; height:width
            color:"saddlebrown"
            Layout.alignment: Qt.AlignBottom
        }

        Rectangle{
            width:60; height:width
            color:"Coral"
        }

        Rectangle{
            width:50; height:width
            color:"dodgerblue"
        }

        Rectangle{
            width:40; height:width
            color:"magenta"
        }
    }
}
