import QtQuick 2.6

Flipable {
    id: container

    property bool flipped: true
    property int xAxis: 0
    property int yAxis: 1
    property int angle: 180

    width: front.width
    height: front.height
    state: "back"

    function flipableClick(){
        container.flipped = !container.flipped
    }

    transform: Rotation {
        id: rotation;
        origin.x: container.width / 2;
        origin.y: container.height / 2
        axis.x: container.xAxis;
        axis.y: container.yAxis;
        axis.z: 0
    }

    states: [
        State {
            name: "back";
            when: container.flipped
            PropertyChanges {
                target: rotation;
                angle: container.angle
            }
        }
    ]

    transitions: Transition {

        SequentialAnimation {
            ParallelAnimation{
                NumberAnimation {
                    target: container;
                    property: "scale";
                    to: 0.88;
                    duration: 100
                }
                NumberAnimation {
                    target: container;
                    property: "opacity";
                    to:0.7
                    duration: 100;
                    easing.type: Easing.Linear
                }
            }

            ParallelAnimation {
                NumberAnimation {
                    target: container;
                    property: "scale";
                    to: 0.75;
                    duration: 130
                }
                NumberAnimation {
                    target: rotation;
                    properties: "angle";
                    duration: 290
                }
                NumberAnimation {
                    target: container;
                    property: "opacity";
                    to:0.4
                    duration: 290;
                    easing.type: Easing.Linear
                }
            }
            ParallelAnimation{
                NumberAnimation {
                    target: container;
                    property: "scale"
                    to: 1.0
                    duration: 170
                }
                NumberAnimation {
                    target: container;
                    property: "opacity";
                    to:1
                    duration: 170;
                    easing.type: Easing.Linear
                }

            }
        }
    }
}
