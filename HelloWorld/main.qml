import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    property date myDate: "2014-05-30"
    property string myString: "http://syncor.blogspot.com"
    property string myUrl: "http://syncor.blogspot.com"

    /*Text{
        text: Qt.formatDate(myDate, "yyyy-MMM-dd")
        font.pixelSize: 16
        color: "teal"
        onTextChanged: console.log(myString === myUrl)
    }*/

    VerticalField{
        vFieldLabelId.text: "A new Label"
        vFieldTextId.text: "100.00"
    }

    Rectangle {
        width: textId.implicitWidth+10
        height: textId.implicitHeight+5
        color: "dodgerblue" //no color makes the element transparent
        anchors.centerIn: parent
        Text {
            id: textId
            text: myString
            anchors.centerIn: parent
            font.pixelSize: 24
        }
    }
}
