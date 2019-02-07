import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.XmlListModel 2.12

ApplicationWindow {
    id: rootId
    visible: true
    width: 640
    height: 480
    title: qsTr("XML ListModel Demo")

    function formatAuthor(name){
        var new_name = name.replace("-", " ")
        return new_name.replace(/\w\S*/g, capitalize)
    }

    function capitalize(value){
        return value.charAt(0).toUpperCase() + value.slice(1)
    }

    XmlListModel{
        id:moduleId
        source: "qrc:///sample.xml"
        query: "/modules/module"
        XmlRole{name: "author"; query:"author/string()"}
        XmlRole{name: "title"; query:"title/string()"}
        XmlRole{name: "description"; query:"description/string()"}

        onStatusChanged:{
            var pre = "XmlListModel."
            if (status === XmlListModel.Ready) print(pre + "Ready -count:", count);
            if (status === XmlListModel.Loading) print(pre + "Loading...");
            if (status === XmlListModel.Error) print(pre + "Error: ", errorString());
            if (status === XmlListModel.Null) print(pre + "Null");
        }
    }

    XmlListModel{
        id:clipsId
        source: "qrc:///sample.xml"
        query:"//clip[@title or @bold]"
        XmlRole{name: "title"; query:"@title/string()"}
        XmlRole{name: "bold"; query:"boolean(@bold)"}
    }

    Column{
        spacing:10
        ListView{
            id:moduleViewId
            width: 600; height:250
            model: moduleId
            clip: true
            delegate: Column{
                spacing: 5
                Label{text:title; font.pixelSize: 24}
                Label{text:formatAuthor(author); font.bold:true}
                Text{text:description; wrapMode: Text.WordWrap; width: rootId.width}
            }
        }
        ListView{
            id:clipsViewId
            width: 600; height: 250
            model: clipsId
            clip:true
            delegate:
                Text{text:title; font.bold: bold; wrapMode: Text.WordWrap; width: 200}
        }
    }
}
