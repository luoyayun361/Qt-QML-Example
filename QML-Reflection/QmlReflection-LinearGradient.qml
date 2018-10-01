import QtQuick 2.0
import QtQuick.Controls 1.4

Rectangle {
    id: window

    width: 600
    height: 500

    gradient: Gradient {
        GradientStop { position: 0; color: "lightsteelblue" }
        GradientStop { position: 1; color: "black" }
    }

    Image {
        id: img
        width: 300
        height: 170
        source: "car.png"
        anchors.centerIn: parent
    }
    Item{
            width: img.width
            height: img.height

            Image{
                source: img.source
                anchors.fill: parent
                transform: Scale{
                    yScale: -1
                    origin.y:img.height/2.
                }
            }
            LinearGradient{
                width: img.width
                height: img.height
                gradient: Gradient{
                    GradientStop{position: 0.0;color:Qt.rgba(0,0,0,0.1)}
                    GradientStop{position: 0.4;color:Qt.rgba(0,0,0,1)}
                }
            }
        }
}
