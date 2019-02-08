import QtQuick 2.9
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2

ApplicationWindow {
    property string baseAppName: qsTr("Dialog Demo")
    property string folderToOpenUrl: ""
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
        }
    }

    FileDialog{
        id:folderDialogId
        selectFolder: false
        nameFilters: ["Text files(*.txt)", "Xml files (*.xml)"]
        title: baseAppName
        modality: Qt.WindowModal
        onAccepted: folderToOpenUrl = fileUrl
        onRejected: folderToOpenUrl = "file not selected"

    }

}
