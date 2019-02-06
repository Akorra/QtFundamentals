import QtQuick 2.0

FocusScope{
    id:myWidgetFocusId
    property alias color: myWidgetId.color
    width: myWidgetId.width
    height: myWidgetId.height
    Rectangle{
        id:myWidgetId
        function setText(event){
            var the_key = event.key
            if(the_key === Qt.Key_1) return "We are number 1."
            if(the_key === Qt.Key_2) return "I took a number 2."
           if(the_key === Qt.Key_3) return "I got to 3rd base."
           return "I am not on the podium."
       }
        focus:true
       radius:7

       color:"cornflowerblue"
       width:250;height:35
       Text{
           id:widgetLabelId
            anchors.fill:parent
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        Keys.onPressed: widgetLabelId.text = setText(event)
    }
    MouseArea{
        anchors.fill:parent
        onClicked: myWidgetFocusId.focus = true
    }
}
