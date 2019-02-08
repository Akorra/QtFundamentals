import QtQuick 2.9
import QtQuick.Controls 1.2
import QtQuick.XmlListModel 2.12
import QtQuick.Layouts 1.3 //split view

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Flickr Demo")
    id: rootId

    property string flickrStatus
    property string progressMessage
    property bool progressBarVisible: false
    property url fullImageUrl
    property string tag : "windsurfing"

    XmlListModel{
        id : flickrModelId
        namespaceDeclarations: "declare namespace media = 'http://search.yahoo.com/mrss/';"
        source: "http://api.flickr.com/services/feeds/photos_public.gne?format=rss2&tags="+tag
        query: "//item[title and media:thumbnail and media:content]"
        XmlRole{name:"title"; query:"title/string()"}
        XmlRole{name:"thumbnail"; query:"media:thumbnail/@url/string()"}
        XmlRole{name:"fullImage"; query:"media:content/@url/string()" }
        onStatusChanged: {
            if (status === XmlListModel.Ready)  {
                flickrStatus = "Found " + count + " items for "+ source
                fullImageUrl = flickrModelId.get(flickrDelegateId.index).fullImage
            }
            if (status === XmlListModel.Loading) flickrStatus = "Flickr Loading...";
            if (status === XmlListModel.Error)   flickrStatus = "Flickr Error: "+errorString() ;
            if (status === XmlListModel.Null)    flickrStatus = "Flickr Null Result"
        }
    }

    TextField{
        id : userValueId
        font.pointSize: 14
        width: parent.width
        height : implicitHeight
        placeholderText: "Enter a Flickr Tag"
        onEditingFinished: tag = text
    }

    SplitView{
        id : flickrSplitViewid
        anchors.fill: parent
        anchors.topMargin: userValueId.height + 10
        orientation: Qt.Horizontal

        ListView{
            id : flickListViewId
            Layout.minimumWidth: 400
            Layout.maximumWidth: parent.width - 50
            model: flickrModelId
            delegate:  flickrDelegateId
            highlight: Rectangle{color :  "lemonchiffon" }
        }

        Image{
            id :imageId
            source : fullImageUrl
            fillMode : Image.PreserveAspectFit
            Layout.minimumWidth: 50
            Layout.fillWidth: true
            onStatusChanged: {
                progressBarVisible =  false;
                if (status === Image.Loading){
                    progressMessage = "Loading..."
                    progressBarVisible = true;
                }
                if (status === Image.Error){
                    progressMessage = "Error loading:"+imageId.source
                }
                else
                {
                    progressMessage = "Loaded:"+imageId.source
                }

            }
        }
    }

    Component{
        id: flickrDelegateId
        Item{
            id :itemId
            height : rowId.height + 5
            width : rowId.width
            Row{
                id : rowId
                spacing : 5

                Image{
                    id : imageId
                    source : thumbnail
                }
                Text{
                    width : 100
                    font.pixelSize: 12
                    elide: Text.ElideRight
                    text: title
                }
                Text{
                    width : 200
                    elide: Text.ElideMiddle
                    text: thumbnail
                }
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    flickListViewId.currentIndex = index
                    fullImageUrl = flickrModelId.get(index).fullImage

                }

            }
        }

    }

    statusBar: StatusBar{
        RowLayout{
            width: parent.width
            spacing : 5
            SplitView
            {
                anchors.fill : parent
                Text{text: flickrStatus
                    font.bold:true
                    elide: Text.ElideRight}
                Text{
                    text: progressMessage
                    Layout.fillWidth: true;
                    elide: Text.ElideLeft
                }
                ProgressBar {
                    id :progBarId
                    visible : progressBarVisible
                    Layout.minimumWidth: 150
                    value : imageId.progress
                }
            }
        }
    }
}

