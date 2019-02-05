import QtQuick 2.9
import QtQuick.Controls 2.0

Column{
    id:rootId
    property alias vFieldLabelId: labelId
    property alias vFieldTextId: textFieldId
    Label{
        id: labelId
        text: "Some Label"
    }
    TextField{
        id: textFieldId
        maximumLength: 100
    }
}
