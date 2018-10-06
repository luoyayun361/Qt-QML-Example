import QtQuick 2.6

  Item {
      id:root
      width: 500; height: 400

      Rectangle {
          id:rect
          x: 10; y: 10
          width: 50; height: 50
          color: "red"

          NumberAnimation on x{
              id:ani
              duration: 400
              easing.type: Easing.OutCubic
          }


          Drag.active: dragArea.drag.active

          MouseArea {
              id: dragArea
              anchors.fill: parent

              drag.target: parent
              drag.maximumY:root.height-rect.height
              drag.minimumY: 0
              onPositionChanged: {
                  console.log("x",mouseX,"y",mouseY,rect.x,rect.y)
              }

              onReleased: {
                  if(rect.x > root.width/2.){
                      ani.to = root.width - rect.width
                      ani.start()
                  }
                  else{
                      ani.to = 0
                      ani.start()
                  }
              }
          }
      }
  }
