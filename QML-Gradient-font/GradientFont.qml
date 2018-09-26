import QtQuick 2.6

Item{
    width: 200
    height: 100
    Rectangle {
      id: gradientRect
      width: 10
      height: 10
      gradient: Gradient {
          GradientStop { position: 0; color: "white" }
          GradientStop { position: 1; color: "steelblue" }
      }
      visible: false; // should not be visible on screen.
      layer.enabled: true;
      layer.smooth: true
  }

  Text {
      id: textItem
      font.pixelSize: 48
      text: "Gradient Text"
      anchors.centerIn: parent
      layer.enabled: true
      // This item should be used as the 'mask'
      layer.samplerName: "maskSource"
      layer.effect: ShaderEffect {
          property var colorSource: gradientRect;
          fragmentShader: "
                    uniform lowp sampler2D colorSource;
                    uniform lowp sampler2D maskSource;
                    uniform lowp float qt_Opacity;
                    varying highp vec2 qt_TexCoord0;
                    void main() {
                        gl_FragColor =
                            texture2D(colorSource, qt_TexCoord0)
                            * texture2D(maskSource, qt_TexCoord0).a
                            * qt_Opacity;
                    }
                "
      }
  }
}
