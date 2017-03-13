import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.2

Item {
    id: page
    width: 700
    height: 700
    property alias rect: rect
    property alias mouseAreaBR: mouseAreaBR
    property alias botR: botR
    property alias mouseAreaBM: mouseAreaBM
    property alias botM: botM
    property alias mouseAreaBL: mouseAreaBL
    property alias botL: botL
    property alias mouseAreaMR: mouseAreaMR
    property alias midR: midR
    property alias mouseAreaMM: mouseAreaMM
    property alias midM: midM
    property alias mouseAreaML: mouseAreaML
    property alias mouseAreaTR: mouseAreaTR
    property alias midL: midL
    property alias topR: topR
    property alias mouseAreaTM: mouseAreaTM
    property alias topM: topM
    property alias mouseAreaTL: mouseAreaTL
    property alias topL: topL
    property alias image: image

    Image {
        id: image
        x: 0
        y: 0
        source: "cadrillage.png"
    }

    Rectangle {
        id: topL
        x: 0
        y: 0
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaTL
            anchors.fill: parent
        }
    }

    Rectangle {
        id: topM
        x: 310
        y: 0
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaTM
            anchors.fill: parent
        }
    }

    Rectangle {
        id: topR
        x: 620
        y: 0
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaTR
            anchors.fill: parent
        }
    }

    Rectangle {
        id: midL
        x: 0
        y: 310
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaML
            anchors.fill: parent
        }
    }

    Rectangle {
        id: midM
        x: 310
        y: 310
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaMM
            anchors.fill: parent
        }
    }

    Rectangle {
        id: midR
        x: 620
        y: 310
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaMR
            anchors.fill: parent
        }
    }

    Rectangle {
        id: botL
        x: 0
        y: 620
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaBL
            anchors.fill: parent
        }
    }

    Rectangle {
        id: botM
        x: 310
        y: 620
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaBM
            anchors.fill: parent
        }
    }

    Rectangle {
        id: botR
        x: 620
        y: 620
        width: 20
        height: 20
        color: "#00000000"
        border.color: "#00000000"

        MouseArea {
            id: mouseAreaBR
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rect
        x: 138
        y: 34
        width: 20
        height: 20
        color: "#4d0cce"
    }


}
