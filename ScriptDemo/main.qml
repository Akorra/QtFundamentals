import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import "util1.js" as MyUtils1

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Script Demo")
    property double phi: 1.618

    Button{
        id: setWidthId
        text: "Set Width"
        height: 50
        width: height*phi
        onClicked: Qt.binding( function() {
            return width = height*phi
        })
    }

    Button{
        id: setHeightId
        text: "Set Height"
        onClicked: setWidthId.height *= 1.2
        anchors.top:setWidthId.bottom
        anchors.topMargin: 10
    }

    /*
    Button{
        id: btn1Id
        text: "Button 1"
        onClicked: MyUtils1.sayHello3("Button 1 calling.")
    }
    Item {
        id: itemId
        anchors.top:btn1Id.bottom
        function localFunc(param){
            print("Local function:" + param )
        }

        Button {
            id:scopeTestId
            text: "Scope Test"
            onClicked: itemId.localFunc("scope test.") //we can use unspecified func call if func in object or root
        }
    }
    */
}
