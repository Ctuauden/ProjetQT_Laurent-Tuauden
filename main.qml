import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true
    width: 700    // taille de la fenetre
    height: 700
    title: qsTr("Jeu de l'Araignée")

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("&Open")
                onTriggered: console.log("Open action triggered");
            }
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MainForm {
        anchors.fill: parent
        id : rectangle
        mouseArea00{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(0);}
        }
        mouseArea01{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(1);
                }
        }
        mouseArea02{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(2);}
        }
        mouseArea10{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(3);
                }
        }
        mouseArea11{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(4);}
        }
        mouseArea12{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(5);
                }
        }
        mouseArea20{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(6);}
        }
        mouseArea21{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(7);
                }
        }
        mouseArea22{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(8);}
        }
    }
}
