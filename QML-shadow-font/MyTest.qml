import QtQuick 2.9
import QtQuick.Controls 2.3


Rectangle{
    width: 200
    height: 200

    Column{
        spacing: 15
        anchors.centerIn: parent
        GlowingLabel {
            text: qsTr("Qt Quick")
            color: "white"
            font.pixelSize: Qt.application.font.pixelSize * 2
        }
        GlowingLabel {
            text: qsTr("Hello World")
            color: "red"
            font.pixelSize: Qt.application.font.pixelSize * 2.5
        }

        GlowingLabel {
            text: qsTr("你好吗")
            color: "cyan"
            font.pixelSize: Qt.application.font.pixelSize * 2
        }
    }

}
