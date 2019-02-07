import QtQuick 2.0

Component{
    Rectangle{
        color: "darkturquoise"
        width: ListView.view.rowWidth
        height: ListView.view.rowHeight
        Text{
            text:"Header"
            anchors.centerIn: parent
            font.pointSize: parent.ListView.view.fontSize
            color:"white"
            rotation: isVertical? 0:-90
        }
    }
}
