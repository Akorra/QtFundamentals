import QtQuick 2.0

ListView{
    property int fontSize: 24
    property bool isVertical: orientation === Qt.Vertical
    property int singleRowHeight: 50
    property int fullWidth: 180
    property int rowWidth: isVertical? fullWidth : singleRowHeight
    property int rowHeight: isVertical? singleRowHeight : fullWidth
    property int fullHeight: singleRowHeight*(count+2)
    model: 3
    width: isVertical? fullWidth:fullHeight
    height: isVertical? fullHeight:fullWidth
    header: Header{id: theHeader}
    delegate: Delegate{id: theDelegate}
    footer: Footer{id: theFooter}
    clip:true
}
