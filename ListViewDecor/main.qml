import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Listmodel Demo")

    property color borderColor: "silver"
    property int borderWidth: 2
    Gradient{
        id:appColorsId
        GradientStop{position:0.0; color:"powderblue"}
        GradientStop{position:1.0; color:"dodgerblue"}
    }


    ListModel{
        id:listModelId
        property int fontSize: 24
        ListElement { name: "Anders"; category: "C#" }
        ListElement { name: "Bjarne"; category: "C++" }
        ListElement { name: "Brian"; category: "C" }
        ListElement { name: "Dennis"; category: "C" }
        ListElement { name: "Eirik"; category: "Qt" }
        ListElement { name: "Linus"; category: "Linux" }
        ListElement { name: "Haavard"; category: "Qt" }
    }

    ListView{
        id:listViewId
        model:listModelId
        anchors.fill: parent
        delegate: delegateId
        highlight: Rectangle{
            width:parent.width
            color:"lightgray"
        }
        header: Rectangle{
            width:parent.width; height:50
            gradient: appColorsId
            border {color: borderColor; width: borderWidth}
            Text{
                text:"Founding Fathers"
                font.pixelSize: 32
                anchors.centerIn: parent
            }
        }
        footer: Rectangle{
            width:parent.width; height:50
            gradient: appColorsId
            border {color: borderColor; width: borderWidth}
            Text{
                text:"Founding Fathers"
                font.pixelSize: 32
                anchors.centerIn: parent
            }
        }
        section {
            property: "category"
            criteria: ViewSection.FullString
            labelPositioning: ViewSection.InlineLabels
            delegate: Rectangle{
                width: listViewId.width
                height: 20
                color:"lightsteelblue"
                Text{text:section;font.pixelSize: listViewId.fontSize}
            }
        }
    }
    Component{
        id:delegateId
        Item{
            id:rowId
            height: datarowId.implicitHeight
            width: datarowId.implicitWidth
            Row{
                id:datarowId
                spacing: 10
                Text{
                    text:index+" - "+model.name
                    font.pixelSize: rowId.ListView.view.fontSize
                }
                Text{
                    text:category
                    font.pixelSize: ListViewId.fontSize
                }
            }
            MouseArea{
                anchors.fill:parent
                onClicked: rowId.ListView.view.currentIndex = index
            }
        }
    }
}
