import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Listmodel Demo")

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
        delegate: Row{
            id:rowId
            spacing:10
            Text{
                text: index + ", " + model.name
                font.pixelSize: 24
            }
            Text{
                text: category
                font.pixelSize: 24
                Component.onCompleted: print("Row " + listViewId.height)
            }
        }
        Component.onCompleted: print("List View Height:" + height + ", Width:" + width)
    }
}
