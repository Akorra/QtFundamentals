import QtQuick 2.9
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.2

ApplicationWindow {
    id: rootId

    property string baseAppName: qsTr("Dialog Demo")
    property int fileIndex : 0
    property int colorIndex: 1
    property int fontIndex : 2
    property int messageIndex: 3
    property int customIndex: 4
    //eproperty int buttonIndex: 5
    property string noSelection: "no Selection"

    function setModelValue(index, value){
        modelId.setProperty(index, "value", value)
    }

    visible: true
    width: 860
    height: 480
    title: baseAppName

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

    Action{
        id:messageOpenActionId
        text:"Show Message..."
        icon.source: "images/message.png"
        onTriggered: messageDialogId.open()
    }

    Action{
        id:customDialogActionId
        text:"Show Custom Dialog..."
        icon.source: "images/date.png"
        onTriggered: customDialogId.open()
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
            ToolButton{ action:messageOpenActionId }
            ToolButton{ action:customDialogActionId }
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
        ListElement{name:"Message"; value:"no selection"}
        ListElement{name:"Custom"; value:"no selection"}
        //ListElement{name:"Clicked"; value:""}
    }

    TableView{
        width: parent.width
        model:modelId
        TableViewColumn{role: "name"; title:"Dialog Type"; width:100}
        TableViewColumn{role: "value"; title:"Result"; width:300}
    }

    MessageDialog{
        id:messageDialogId
        title: baseAppName
        text:"Don't you love Qt?"
        icon: StandardIcon.Question
        standardButtons: StandardButton.Yes | StandardButton.No
        onYes: setModelValue(messageIndex, "Yes")
        onNo:  setModelValue(messageIndex, "No")
        //onAccepted: setModelValue(messageIndex, "Yes")
        //onRejected: setModelValue(messageIndex, "No")
    }

    Dialog{
        id : customDialogId
        width: dialogRowid.width + 20
        height : 200
        signal heckYeahClicked()
        Row{
            id :dialogRowid
            spacing : 6
            Image{
                source : "images/message.png"
                width : 128 ; height: width
            }
            Text{
                id : dialogTextId
                text: "Don't you love Qt?"
                font.pixelSize: 32
                Row{
                    anchors.top : parent.bottom
                    anchors.topMargin: 12
                    spacing : 6
                    Button{
                        text: "Yeah"
                        onClicked: customDialogId.click(StandardButton.Ok)
                    }
                    Button{
                       text: "Heck Yeah!"
                       onClicked:{ customDialogId.heckYeahClicked()
                           customDialogId.close()
                       }
                    }
                }
            }
        }
        onAccepted : setModelValue(customIndex, "Yeah")
        onHeckYeahClicked: setModelValue(customIndex, "Heck Yeah!")
    }

    /*
    Dialog{
        id:customDialogId
        width:300
        height:350
        Calendar{
            id: calendarId
            width: parent.width
            onDoubleClicked: customDialogActionId.click(StandardButton.OK)
        }
        onAccepted: setModelValue(customIndex,calendarId.selectedDate.toLocaleDateString())
        onButtonClicked: setModelValue(buttonIndex, clickedButton)
    }
    */
}
