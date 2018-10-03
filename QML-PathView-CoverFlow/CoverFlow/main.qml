import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    visible: true
    width: 600
    height: 400
    title: qsTr("Cover Flow")

    ListModel{
        id:model
        ListElement{url:"qrc:/image/1.jpg"}
        ListElement{url:"qrc:/image/2.jpg"}
        ListElement{url:"qrc:/image/3.jpg"}
        ListElement{url:"qrc:/image/4.jpg"}
        ListElement{url:"qrc:/image/5.jpg"}
    }

    CoverFlow{
        anchors.fill:parent
        model:model
    }

}
