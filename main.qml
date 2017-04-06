import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.4


ApplicationWindow {
    visible: true
    width: 700    // taille de la fenetre
    height: 730
    title: qsTr("Jeu de l'Araignée")

    menuBar: MenuBar {
        Menu {
            title: qsTr("Couleur Joueur1")
            MenuItem {
                text: qsTr("Vert")
                onTriggered: Jeu.changement_couleur(1,"#00ff00");
                }
            MenuItem {
                text: qsTr("Bleu")
                onTriggered: Jeu.changement_couleur(1,"#0000ff");
            }
            MenuItem {
                text: qsTr("Jaune")
                onTriggered: Jeu.changement_couleur(1,"#ffff00");
            }
        }
        Menu {
            title: qsTr("Couleur Joueur2")
            MenuItem {
                text: qsTr("Vert")
                onTriggered: Jeu.changement_couleur(2,"#00ff00");
                }
            MenuItem {
                text: qsTr("Bleu")
                onTriggered: Jeu.changement_couleur(2,"#0000ff");
            }
            MenuItem {
                text: qsTr("Jaune")
                onTriggered: Jeu.changement_couleur(2,"#ffff00");
            }
        }
    }

    MainForm {
        anchors.fill: parent
        id : rectangle
        mouseArea00{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(0,0);
                Jeu.changement(0);
                if(Jeu.get_victoire()==1)  // si victoire du joueur 1
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné")); }       // afficher un message dans un nouvelle fenetre
                if(Jeu.get_victoire()==2)  // si victoire du joueur 2
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre

        }
        mouseArea01{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(0,1);
                Jeu.changement(1);
                if(Jeu.get_victoire()==1)  // si victoire du joueur 1
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}  // afficher un message dans un nouvelle fenetre
                if(Jeu.get_victoire()==2)  // si victoire du joueur 2
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre
                }

        mouseArea02{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(0,2);
                Jeu.changement(2);
        if(Jeu.get_victoire()==1)  // si victoire du joueur 1
            {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}  // afficher un message dans un nouvelle fenetre
        if(Jeu.get_victoire()==2)  // si victoire du joueur 2
            {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre
}


        mouseArea10{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(1,0);
                Jeu.changement(3);
                if(Jeu.get_victoire()==1)  // si victoire du joueur 1
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}  // afficher un message dans un nouvelle fenetre
                if(Jeu.get_victoire()==2)  // si victoire du joueur 2
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre
        }
        mouseArea11{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(1,1);
                Jeu.changement(4);
                if(Jeu.get_victoire()==1)  // si victoire du joueur 1
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}  // afficher un message dans un nouvelle fenetre
                if(Jeu.get_victoire()==2)  // si victoire du joueur 2
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre
        }
        mouseArea12{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(1,2);
                Jeu.changement(5);
                if(Jeu.get_victoire()==1)  // si victoire du joueur 1
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}  // afficher un message dans un nouvelle fenetre
                if(Jeu.get_victoire()==2)  // si victoire du joueur 2
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre}
        }
        mouseArea20{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(2,0);
                Jeu.changement(6);
                if(Jeu.get_victoire()==1)  // si victoire du joueur 1
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}  // afficher un message dans un nouvelle fenetre
                if(Jeu.get_victoire()==2)  // si victoire du joueur 2
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre}
        }
        mouseArea21{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(2,1);
                Jeu.changement(7);
                if(Jeu.get_victoire()==1)  // si victoire du joueur 1
                    {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}  // afficher un message dans un nouvelle fenetre
                if(Jeu.get_victoire()==2)  // si victoire du joueur 2
                    {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre}
        }
        mouseArea22{
            onClicked:
                {/*Jeu.increment();*/
                Jeu.deplacement(2,2);
                Jeu.changement(8);
            if(Jeu.get_victoire()==1)  // si victoire du joueur 1
                {messageDialog.show(qsTr("Joueur 1, vous avez gagné"));}  // afficher un message dans un nouvelle fenetre
            if(Jeu.get_victoire()==2)  // si victoire du joueur 2
                {messageDialog.show(qsTr("Joueur 2, vous avez gagné"));}} // afficher un message dans un nouvelle fenetre}
    }
        button1.onClicked: Jeu.nouvelle_partie()  // pour lançer une nouvelle partie
}

// message à afficher quand victoire
MessageDialog {
    id: messageDialog
    title: qsTr("Fin de la partie !")

    standardButtons: StandardButton.Yes | StandardButton.No
        onYes: Jeu.nouvelle_partie()
        onNo: Qt.quit()

    function show(caption) {
        messageDialog.text = caption+" ! Voulez-vous rejouez ?";
        messageDialog.open();
    }
}
}

