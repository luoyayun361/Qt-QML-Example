import QtQuick 2.6

Rectangle{
    width: 250
    height: 350

    CustomizeFlipable{
        id:flipable
        anchors.fill: parent
        front: rect1
        back: rect2

        MouseArea{
            anchors.fill: parent
            onClicked: {
                flipable.flipableClick()
            }
        }
    }

    Rectangle{
        id:rect1
        color:"red"
        width: parent.width
        height: parent.height
        Text {
            anchors.centerIn: parent
            font.pixelSize: 30
            font.bold: true
            color:"white"
            text: qsTr("Page 1")
        }
    }

    Rectangle{
        id:rect2
        color:"green"
        width: parent.width
        height: parent.height
        Text {
            anchors.centerIn: parent
            font.pixelSize: 30
            font.bold: true
            color:"white"
            text: qsTr("Page 2")
        }
    }
}
