import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.1

Window {
    id:mainwindow
    visible: true
    width: 400
    height: 600


    Rectangle{
        id:titlebar
        visible: true
        width: parent.width
        height: 50
        z:3
        opacity: 0
        color:"red"
        Item{
            id:item
            anchors.fill: parent
            opacity:1

            Label{
                anchors.centerIn: parent
                text:"hello world!!"
                font.pixelSize: 27
            }

        }

    }


    NumberAnimation {
        id:ani1
        target: view
        property: "contentY"
        duration: 200
        to:-view.headerItem.height
        running: false
        easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        id:ani2
        target: view
        property: "contentY"
        duration: 200
        to:-titlebar.height
        running: false
        easing.type: Easing.InOutQuad
    }

    ListView{
        id:view
        anchors.fill: parent
        model:20

        onContentYChanged:{
            if(view.contentY < -titlebar.height){
                titlebar.opacity = 1-(-view.contentY - titlebar.height)/100.
                titlebar.y = -view.contentY - titlebar.height
            }
            else{
                item.opacity = 1
                titlebar.y = 0
            }

        }

        onMovementEnded: {
            if(view.contentY < -view.headerItem.height/2.){
                ani1.running = true
            }
            else if(view.contentY < -titlebar.height){
                ani2.running = true
            }
        }

        header:Rectangle{
            width: view.width
            height: 150
            color:"red"
            Label{
                id:label
                text:"this is header"
                font.pixelSize: 27
                color:"white"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 30
            }

        }


        delegate:Rectangle{
            id:delegate
            width: view.width
            height: 50
            border.width: 1
            Label{
                anchors.fill: parent
                text: index
            }
        }

        footer: Rectangle{
            id:foot
            width: parent.width
        }



        Component.onCompleted: {
            var t_h = view.model.count * 50 + titlebar.height
            if(t_h < view.height){
                view.footerItem.height = view.height - t_h
            }
        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }

}
