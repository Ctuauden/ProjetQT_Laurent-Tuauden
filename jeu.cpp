#include "jeu.h"
#include "compteur.h"
#include "windows.h"
#include <iostream>

using namespace std;

jeu::jeu(QObject *parent) : QObject(parent)
{
    Init("#000000");
    statesChanged();
}

void jeu::Init(QString value){
    for(int i=0;i<9;i++)
        {D.append(value);}
    C=0;
    CasePrecedente.push_back(-1);
    CasePrecedente.push_back(-1);
    message="";
    couleurj1="#00ff00";
    couleurj2="#0000ff";
    phase=1;
}


/*
void jeu::Set(int x, int y, int value) {
    D[x][y]=value;
}

void jeu::Print(){
    for(int i=0; i<3; i++) {
        cout << endl;
        for(int j=0; j<3; j++){
            cout << D[i][j] << ", ";
        }
    }
}

int jeu::Get(int x, int y) {
    return D[x][y];
}
*/

QList<QString> jeu::readStates()
{
    return D;
}

void jeu::changement(int j) {
    // Cette fonction n'intervient que jusqu'au tour 6 inclu (C=0..5)
    if(C<6){
    if(D[j]=="#000000"){         // si la case est noire (pas déjà occupée)
        // On colorie la case en vert si la main est au joueur 1 ou en blue si la main est au joueur 2
        if(C%2==0)
            {D[j]=couleurj1;
            test_victoire();
        }
        if(C%2==1)
            {D[j]=couleurj2;
            test_victoire();
        }
        C++;
        message="";
        }
    else
        message="Case déjà occupée, cliquez sur une autre";
    }
    if(C==6)
        message="Joueur 1, sélectionnez le pion à déplacer";
    statesChanged();
    cptChanged();
    mesChanged();
}

void jeu::deplacement(int x, int y) {
    // On transmet les coordonées du carré sur lequel on a cliqué.

    // Cette fonction n'intervient qu'après le tour 6.
    if (C>=6){
    if(phase==1){
        if (D[3*x+y]!="#000000"){
            if (C%2==0 && D[3*x+y]==couleurj1){
                CasePrecedente[0]=x;
                CasePrecedente[1]=y;
                phase=2;
                message="Selectionner le nouvel emplacement de ce pion";}
            if (C%2==1 && D[3*x+y]==couleurj2){
                CasePrecedente[0]=x;
                CasePrecedente[1]=y;
                phase=2;
                message="Selectionner le nouvel emplacement de ce pion";}
            if (C%2==0 && D[3*x+y]==couleurj2){
                message="Joueur 1, selectionner un pion de votre couleur";}
            if (C%2==1 && D[3*x+y]==couleurj1){
                message="Joueur 2, selectionner un pion de votre couleur";}
        }
        else{
            message="Erreur : sélectionner un pion de votre couleur pour le déplaçer";
        }
    }

    else
        {if(phase==2){
        if (CasePrecedente[0]==x && CasePrecedente[1]==y)
            message="Sélectionner la case d'arrivée de ce pion";

        // Si la case à bouger n'est pas celle que l'on a sélectionnée auparavant
        if (CasePrecedente[0]!=x || CasePrecedente[1]!=y){

            // On stock les coordonnées de la case précédente dans des variables
            // pour plus de practicité
           int xprecedent, yprecedent;
           xprecedent=CasePrecedente[0];
           yprecedent=CasePrecedente[1];

       // Si c'est au tour du joueur 1
        if (C%2==0){
              // S'il clique sur une case libre qui est voisine de la sienne
              if (D[3*x+y]=="#000000" && std::abs(x-xprecedent)<=1 && std::abs(y-yprecedent)<=1){

                  // On colorie la nouvelle case avec la couleur du joueur 1 et l'ancienne devient libre (noire)
                  D[3*x+y]=couleurj1;
                  D[3*xprecedent+yprecedent]="#000000";
                  test_victoire();

                  // On remet le vecteur CasePrecedente "à 0" pour demander une nouvelle sélection de case
                  CasePrecedente[0]=-1;
                  CasePrecedente[1]=-1;
                  phase=1;

                  // Le déplacement ayant fonctionné, on peut passer au joueur suivant
                  C++;
                  message="Joueur 2, sélectionner le pion à déplacer";
              }
              else
              {if (D[3*x+y]!="#000000")
                  message="Selectionnez une case vide";}
              if (std::abs(x-xprecedent)>1 || std::abs(y-yprecedent)>1)
                  message="Ce déplacement n'est pas possible, selectionner une case accessible";
        }
       // Si c'est au tour du joueur 2
       // Il faut qu'il ait sélectionné aupravant une case lui appartenant
        else{
        if (C%2==1){
              // S'il clique sur une case livre et voisine de la sienne
              if (D[3*x+y]=="#000000" && std::abs(x-xprecedent)<=1 && std::abs(y-yprecedent)<=1){

                  // On colorie la nouvelle case avec la couleur du joueur 2 et l'ancienne devient libre (noire)
                  D[3*x+y]=couleurj2;
                  D[3*xprecedent+yprecedent]="#000000";
                  test_victoire();

                  // On remet le vecteur CasePrecedente "à 0" pour demander une nouvelle sélection de case
                  CasePrecedente[0]=-1;
                  CasePrecedente[1]=-1;
                  phase=1;

                  // Le déplacement ayant fonctionné, on peut passer au joueur suivant
                  C++;
                  message="Joueur 1, sélectionnez le pion à déplacer";
              }
              else
              {if (D[3*x+y]!="#000000")
                  message="Selectionnez une case vide";}
              if (std::abs(x-xprecedent)>1 || std::abs(y-yprecedent)>1)
                  message="Ce déplacement n'est pas possible, selectionner une case accessible";

        }}
        }
    }
    }
    }
    statesChanged();
    cptChanged();
    mesChanged();
}

void jeu::nouvelle_partie(){   // méthode appelée quand on clique sur le bouton "Nouvelle Partie"
    for(int i=0;i<9;i++)
        {D[i]="#000000";}   // remet toutes les cases en noires
    C=0;                    // remet le compteur de tour à 0
    victoire=0;             // remet la victoire à 0
    message="";
    CasePrecedente[0]=-1;
    CasePrecedente[1]=-1;
    phase=1;
    statesChanged();        // actualise les chgmts dans mainform
    cptChanged();
    mesChanged();
}

void jeu::test_victoire(){              // methode appelée à chaque fois que l'on change une case de couleur :
    // met l'attribu victoire à 1 si le joueur 1 a gagné, et à 2 si le joueur 2 a gagné
    // change la couleur sur la ligne gagner : en rouge

    // joueur 1 gagne
    if(D[0]==couleurj1 && D[1]==couleurj1 && D[2]==couleurj1){
        victoire=1;
        D[0]="#ff0000";D[1]="#ff0000";D[2]="#ff0000";}
    if(D[3]==couleurj1 && D[4]==couleurj1 && D[5]==couleurj1){
        victoire=1;
        D[3]="#ff0000";D[4]="#ff0000";D[5]="#ff0000";}
    if(D[6]==couleurj1 && D[7]==couleurj1 && D[8]==couleurj1){
        victoire=1;
        D[6]="#ff0000";D[7]="#ff0000";D[8]="#ff0000";}
    if(D[0]==couleurj1 && D[3]==couleurj1 && D[6]==couleurj1){
        victoire=1;
        D[0]="#ff0000";D[3]="#ff0000";D[6]="#ff0000";}
    if(D[1]==couleurj1 && D[4]==couleurj1 && D[7]==couleurj1){
        victoire=1;
        D[1]="#ff0000";D[4]="#ff0000";D[7]="#ff0000";}
    if(D[2]==couleurj1 && D[5]==couleurj1 && D[8]==couleurj1){
        victoire=1;
        D[2]="#ff0000";D[5]="#ff0000";D[8]="#ff0000";}
    if(D[0]==couleurj1 && D[4]==couleurj1 && D[8]==couleurj1){
        victoire=1;
        D[0]="#ff0000";D[4]="#ff0000";D[8]="#ff0000";}
    if(D[2]==couleurj1 && D[4]==couleurj1 && D[6]==couleurj1){
        victoire=1;
        D[2]="#ff0000";D[4]="#ff0000";D[6]="#ff0000";}

    // joueur 2 gagne
    if(D[0]==couleurj2 && D[1]==couleurj2 && D[2]==couleurj2){
        victoire=2;
        D[0]="#ff0000";D[1]="#ff0000";D[2]="#ff0000";}
    if(D[3]==couleurj2 && D[4]==couleurj2 && D[5]==couleurj2){
        victoire=2;
        D[3]="#ff0000";D[4]="#ff0000";D[5]="#ff0000";}
    if(D[6]==couleurj2 && D[7]==couleurj2 && D[8]==couleurj2){
        victoire=2;
        D[6]="#ff0000";D[7]="#ff0000";D[8]="#ff0000";}
    if(D[0]==couleurj2 && D[3]==couleurj2 && D[6]==couleurj2){
        victoire=2;
        D[0]="#ff0000";D[3]="#ff0000";D[6]="#ff0000";}
    if(D[1]==couleurj2 && D[4]==couleurj2 && D[7]==couleurj2){
        victoire=2;
        D[1]="#ff0000";D[4]="#ff0000";D[7]="#ff0000";}
    if(D[2]==couleurj2 && D[5]==couleurj2 && D[8]==couleurj2){
        victoire=2;
        D[2]="#ff0000";D[5]="#ff0000";D[8]="#ff0000";}
    if(D[0]==couleurj2 && D[4]==couleurj2 && D[8]==couleurj2){
        victoire=2;
        D[0]="#ff0000";D[4]="#ff0000";D[8]="#ff0000";}
    if(D[2]==couleurj2 && D[4]==couleurj2 && D[6]==couleurj2){
        victoire=2;
        D[2]="#ff0000";D[4]="#ff0000";D[6]="#ff0000";}
}

int jeu::get_victoire(){  // retourne l'attribu victoire
    return victoire;
}


QString jeu::readmessage()
{
    return message;
}


QString jeu::readCompteur()
{
    return QString::number(C%2+1);
}

/*
void jeu::increment() {
    C++;
    cptChanged();
}*/

void jeu::changement_couleur(int j, QString couleur){
    if (j==1 && couleur!=couleurj2){
        for (int i=0;i<9;i++){
            if (D[i]==couleurj1){
                D[i]=couleur;
            }
        }
        couleurj1=couleur;
    }
    if (j==2 && couleur!=couleurj1){
        for (int i=0;i<9;i++){
            if (D[i]==couleurj2){
                D[i]=couleur;
            }
        }
        couleurj2=couleur;
    }
    statesChanged();
}

/*
void jeu::attente(){
    Sleep(1000);
}*/
