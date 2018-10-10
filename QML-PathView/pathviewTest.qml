import QtQuick 2.0

Rectangle{
    id:root
    width: 500
    height: 600

    PathView {
        anchors.fill: parent
        delegate: flipCardDelegate
        model: 100
        path: Path {
            startY: root.height/2
            startX: 0
            PathAttribute { name: "itemZ"; value: 0 }
            PathAttribute { name: "itemAngle"; value: -90.0; }
            PathAttribute { name: "itemScale"; value: 0.5; }
            PathLine { y: root.height/2; x: root.width*0.4; }
            PathPercent { value: 0.48; }
            PathLine { y: root.height/2; x: root.width*0.5; }
            PathAttribute { name: "itemAngle"; value: 0.0; }
            PathAttribute { name: "itemScale"; value: 1.0; }
            PathAttribute { name: "itemZ"; value: 100 }
            PathLine { y: root.height/2; x: root.width*0.6; }
            PathPercent { value: 0.52; }
            PathLine { y: root.height/2; x: root.width; }
            PathAttribute { name: "itemAngle"; value: 90.0; }
            PathAttribute { name: "itemScale"; value: 0.5; }
            PathAttribute { name: "itemZ"; value: 0 }
        }
        pathItemCount: 6
//        preferredHighlightBegin: 0.5
//        preferredHighlightEnd: 0.5
    }


    Component {
        id: flipCardDelegate
        Item {
            id: wrapper
            width: 64
            height: 64
            visible: PathView.onPath
            scale: PathView.itemScale
            smooth: true
            z: PathView.itemZ
            property variant rotX: PathView.itemAngle
            transform: Rotation { axis { x: 0; y: 1; z: 0 }angle:	wrapper.rotX;	origin	{	y:	32;	x:	3}}
            Rectangle {
                anchors.fill: parent
                color: "lightGray"
                border.color: "black"
                border.width: 3
            }
            Text {
                anchors.centerIn: parent
                text: index
                font.pixelSize: 30
            }

        }
    }
}
