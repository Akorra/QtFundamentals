import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: rootId

    property string baseAppName: qsTr("Dialog Demo")
    property int fileIndex : 0
    property int colorIndex: 1
    property int fontIndex : 2
    property string noSelection: "no Selection"

    function setModelValue(index, value){
        modelId.setProperty(index, "value", value)
    }

    visible: true
    width: 640
    height: 480
    title: baseAppName + " - " + folderToOpenUrl

    Action{
        id:quitActionId
        text: qsTr("Exit")
        icon { color:"transparent"; source:"images/exit.png" }
        onTriggered: Qt.quit()
    }

    Action{
        id:folderOpenActionId
        text: "Open Folder..."
        icon { color:"transparent"; source:"images/folderopen.png" }
        onTriggered: folderDialogId.open()
    }

    Action{
        id:colorOpenActionId
        text: "Color Picker..."
        icon { color:"transparent"; source:"images/color.png" }
        onTriggered: colorDialogId.open()
    }

    Action{
        id:fontOpenActionId
        text: "Font Picker..."
        icon { color:"transparent"; source:"images/font.png" }
        onTriggered: fontDialogId.open()
    }

    menuBar: MenuBar{
        Menu{
            title: qsTr("File")
            MenuItem{
                action: quitActionId
            }
        }
    }

    header: ToolBar{
        Row{
            ToolButton{ action:quitActionId }
            ToolButton{ action:folderOpenActionId }
            ToolButton{ action:colorOpenActionId }
            ToolButton{ action:fontOpenActionId }
        }
    }

    ColorDialog{
        id:colorDialogId
        title: baseAppName
        onAccepted: modelId.setProperty(colorIndex,"value", color.toString())
        onRejected: modelId.setProperty(colorIndex,"value", noSelection)
    }

    FontDialog{
        id:fontDialogId
        title: baseAppName
        monospacedFonts: false
        proportionalFonts: false
        nonScalableFonts: true
        scalableFonts: false
        onAccepted: setModelValue(fontIndex, font.family)
        onRejected: setModelValue(fontIndex, noSelection)
    }

    FileDialog{
        id:folderDialogId
        selectFolder: false
        nameFilters: ["Text files(*.txt)", "Xml files (*.xml)"]
        title: baseAppName
        modality: Qt.WindowModal
        onAccepted: setModelValue(fileIndex, fileUrl.toString())
        onRejected: setModelValue(fileIndex, noSelection)

    }

    ListModel{
        id:modelId
        ListElement{name:"File/Folder"; value:"no selection"}
        ListElement{name:"Color"; value:"no selection"}
        ListElement{name:"Font"; value:"no selection"}
    }

    TableView{
        width: parent.width
        model:modelId
        TableViewColumn{role: "name"; title:"Dialog Type"; width:100}
        TableViewColumn{role: "value"; title:"Result"; width:300}
    }
}
