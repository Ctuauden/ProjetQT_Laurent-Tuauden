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
                Jeu.changement(0);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}}
        }
        mouseArea01{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(1);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}
                }
        }
        mouseArea02{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(2);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}}
        }
        mouseArea10{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(3);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}
                }
        }
        mouseArea11{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(4);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}}
        }
        mouseArea12{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(5);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}
                }
        }
        mouseArea20{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(6);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}}
        }
        mouseArea21{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(7);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}
                }
        }
        mouseArea22{
            onClicked:
                {vueObjetCpt.increment();
                Jeu.changement(8);
                if(Jeu.get_victoire()==1)
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}
                if(Jeu.get_victoire()==2)
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}
                }
        }
        button1.onClicked: Jeu.nouvelle_partie()
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("Fin de la partie !")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
