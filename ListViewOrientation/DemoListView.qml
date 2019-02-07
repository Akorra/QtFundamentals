import QtQuick 2.0

ListView{
    id: listViewId
    property int fontSize: 24
    property bool isVertical: orientation === Qt.Vertical
    property int rowWidth: isVertical? 180 : 50
    property int rowHeight: isVertical? 50 : 180
    model: 5
    width: isVertical? 200:300
    height: isVertical? 300:200
    header: Header{}
    delegate: Delegate{}
    footer: Footer{}
}
