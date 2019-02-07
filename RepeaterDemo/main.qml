import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 900
    height: 350
    title: qsTr("Hello World")

    property variant directionSetting : [ListView.TopToBottom,
                                         ListView.BottomToTop,
                                         ListView.TopToBottom,
                                         ListView.BottomToTop]
    property variant orientationSetting: [Qt.Vertical,
                                          Qt.Vertical,
                                          Qt.Horizontal,
                                          Qt.Horizontal]

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

    property var objectList: [
        {name: "Syncor Systems Inc.", service: "Programming"},
        {name: "PluralSight", service: "Training"}
    ]
    property var stringList: ["Thing 1", "Thing 2"]

    Column{
        spacing:10
        Repeater{
            model:stringList
            Text{text:modelData}
            //model:objectList
            //Text{ text: modelData.name + " : " + modelData.service }
            //model: listModelId
            //delegate: Text{text:name}
            //model:3
            //DemoListView{
            //    verticalLayoutDirection: directionSetting[index]
            //    orientation: orientationSetting[index]
            //}
        }
    }
}
