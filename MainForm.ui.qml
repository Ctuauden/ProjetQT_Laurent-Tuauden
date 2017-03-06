import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: page
    width: 640
    height: 480
    property alias mouseArea2: mouseArea2
    property alias bottomLeftRect: bottomLeftRect
    property alias mouseArea1: mouseArea1
    property alias middleRightRect: middleRightRect
    property alias mouseArea: mouseArea
    property alias topLeftRect: topLeftRect
    property alias icon: icon

    Image {
        id: icon
        x: 10
        y: 20
        width: 64
        height: 64
        fillMode: Image.PreserveAspectFit
        clip: false
        source: "qtlogo.png"


    }

    Rectangle {
        id: topLeftRect
        width: 55
        height: 41
        color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 20
        border.color: "#808080"

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: StateGroup.state=''
        }
    }

    Rectangle {
        id: middleRightRect
        x: 8
        y: 2
        width: 55
        height: 41
        color: "#00000000"
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#808080"
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            onClicked: StateGroup.state='State1'
        }
    }

    Rectangle {
        id: bottomLeftRect
        y: 0
        width: 55
        height: 41
        color: "#00000000"
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        border.color: "#808080"
        MouseArea {
            id: mouseArea2
            anchors.fill: parent
            onClicked: StateGroup.state='State2'
    }
}
}
