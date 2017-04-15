import QtQuick 2.5
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4

Rectangle {
    id: rectangle  // rectangle de fond

    width: 700
    height: 700
    color: "#00000000"   // couleur de fond
    radius: 3
    property alias text2: text2
    border.color: "#ffffff"
    property alias image: image
    property alias rectangle00: rectangle00
    property alias mouseArea00: mouseArea00
    property alias rectangle01: rectangle01
    property alias mouseArea01: mouseArea01
    property alias rectangle02: rectangle02
    property alias mouseArea02: mouseArea02
    property alias rectangle20: rectangle20
    property alias mouseArea20: mouseArea20
    property alias rectangle21: rectangle21
    property alias mouseArea21: mouseArea21
    property alias rectangle22: rectangle22
    property alias mouseArea22: mouseArea22
    property alias mouseArea11: mouseArea11
    property alias rectangle11: rectangle11
    property alias mouseArea10: mouseArea10
    property alias rectangle10: rectangle10
    property alias mouseArea12: mouseArea12
    property alias rectangle12: rectangle12
    property alias text1: text1
    property alias item1: item1
    property alias button1: button1

    border.width: 7    // taille bordure
    // couleur bordure



    Text {   // texte dedans
        id: text1
        x: 110
        y: 668
        width: 100
        height: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Tahoma"
        font.pixelSize: 24
        focus: true     // important !!!!!
        text: "C'est au joueur "+Jeu.cptQML+" de jouer"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
    }

    Rectangle {
        id: rectangle00
        width: 40
        height: 40
        color: Jeu.states[0]
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 30
        border.color: "#000000"

        MouseArea {
            id: mouseArea00
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle10
        y: 100
        width: 40
        height: 40
        color: Jeu.states[3]
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.verticalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#000000"

        MouseArea {
            id: mouseArea10
            anchors.fill: parent
        }
    }


    Rectangle {
        id: rectangle01
        x: 7
        y: 4
        width: 40
        height: 40
        color: Jeu.states[1]
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea {
            id: mouseArea01
            anchors.fill: parent
        }
        anchors.topMargin: 30
        anchors.top: parent.top
        border.color: "#000000"
    }

    Rectangle {
        id: rectangle02
        x: 2
        y: 10
        width: 40
        height: 40
        color: Jeu.states[2]
        anchors.right: parent.right
        anchors.rightMargin: 30
        MouseArea {
            id: mouseArea02
            anchors.fill: parent
        }
        anchors.topMargin: 30
        anchors.top: parent.top
        border.color: "#000000"
    }

    Rectangle {
        id: rectangle20
        y: 10
        width: 40
        height: 40
        color: Jeu.states[6]
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 30
        anchors.left: parent.left
        anchors.leftMargin: 30
        border.color: "#000000"
        MouseArea {
            id: mouseArea20
            anchors.fill: parent
        }
    }

    Rectangle {
        id: rectangle21
        x: 0
        y: 9
        width: 40
        height: 40
        color: Jeu.states[7]
        anchors.horizontalCenter: parent.horizontalCenter
        MouseArea {
            id: mouseArea21
            anchors.fill: parent
        }
        anchors.bottomMargin: 30
        anchors.bottom: parent.bottom
        border.color: "#000000"
    }

    Rectangle {
        id: rectangle22
        x: -1
        y: 3
        width: 40
        height: 40
        color: Jeu.states[8]
        anchors.right: parent.right
        anchors.rightMargin: 30
        MouseArea {
            id: mouseArea22
            anchors.fill: parent
        }
        anchors.bottomMargin: 30
        anchors.bottom: parent.bottom
        border.color: "#000000"
    }
    Rectangle {
        id: rectangle11
        x: 99  // position
        y: 64
        width: 40 // taille
        height: 40
        color: Jeu.states[4]
        anchors.horizontalCenter: parent.horizontalCenter  // centrer sur le cadre rectangle d'avant
        anchors.verticalCenter: parent.verticalCenter
        border.color: "#000000"

        MouseArea {
            id: mouseArea11
            x: -30
            y: 75
            anchors.fill: parent
        }
    }
    Rectangle {
        id: rectangle12
        x: 235
        y: 100
        width: 40
        height: 40
        color: Jeu.states[5]
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 30
        border.color: "#000000"

        MouseArea {
            id: mouseArea12
            anchors.fill: parent
        }
    }

    Image {
        id: image
        width: 640
        height: 640
        z: -1
        anchors.left: parent.left
        anchors.leftMargin: 30
        anchors.top: parent.top
        anchors.topMargin: 30
        source: "cadrillage1.png"
    }
    Item {
        id: item1
        x: 8
        y: 2
        width: 128
        height: 28

        RowLayout {
            anchors.centerIn: parent

            Button {
                id: button1
                text: qsTr("Nouvelle partie")
            }
        }
    }

    Text {
        id: text2
        x: 30
        y: 3
        width: 506
        height: 38
        text: qsTr(Jeu.mesQML)
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignHCenter
        font.family: "Tahoma"
        font.pixelSize: 18
        focus: true
    }
}
