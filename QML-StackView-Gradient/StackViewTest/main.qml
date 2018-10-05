import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.4

Window {
    visible: true
    width: 420
    height: 320
    property int flag: 1
    property var imgList: [img1,img2,img3]

    StackView{
        id:stack
        anchors.fill: parent
        initialItem: img1
        delegate: StackViewDelegate{
            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
            }
            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 1500
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                    duration: 500
                }
            }
        }
    }
    Image {
        id: img1
        source: "1.jpg"
        visible: false
    }
    Image {
        id: img2
        source: "2.jpg"
        visible: false
    }
    Image {
        id: img3
        source: "3.jpg"
        visible: false
    }

    Timer{
        interval: 2000
        repeat: true
        running: true
        onTriggered: {
            stack.push({item:imgList[flag%3],immediate:false,replace:true})
            flag++
        }
    }
}
