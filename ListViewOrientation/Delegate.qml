import QtQuick 2.0

Component{
    id:delegateId
    Rectangle{
        id: dataRectId
        width: rowWidth
        height: ListView.view.rowHeight
        opacity: index * .1 + .5
        color: "green"
        Text{
            id: dataTextId
            text:model.index
            anchors.centerIn: parent
            font.pointSize: parent.ListView.view.fontSize
            opacity: 1
            color:"white"
            horizontalAlignment: Qt.AlignCenter
        }
    }
}
