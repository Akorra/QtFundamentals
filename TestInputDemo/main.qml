import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Text Input Demo")
    property int textMargin:5
    property int textBorderWidth:2

    Rectangle{
        id: textInputRec
        color: "honeydew"
        x: 10
        y: 10
        width:100; height: textInputId.implicitHeight + 2*textMargin
        radius: textMargin
        border.width:textBorderWidth
        border.color:"olivedrab"

        TextInput{ //single line
            id: textInputId
            text: "Placeholder text for a single line"
            wrapMode: TextInput.Wrap
            anchors.margins: textMargin
            anchors.fill: parent
        }

        Flickable{ //cycle through vertical content
            contentHeight: textEditId.height
            width:textEditId.width
            height: 75
            clip:true
            anchors.top: textInputId.bottom
            anchors.topMargin:20

            TextEdit{ //allows multiple lines
                id:textEditId
                width:100
                clip:true //hides everything that goes out of bounds
                wrapMode: TextEdit.Wrap //wraps text to bounds
                anchors.top:textInputId.bottom
                anchors.topMargin:20
                //textFormat: TextEdit.RichText //allows for html
                text:"a lot of text carriage return \\r\r" + "makes a newline, so does newline character \\n\n" + "See?!?"
            }
        }
    }
}
