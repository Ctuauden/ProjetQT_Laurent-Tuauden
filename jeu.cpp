#include "jeu.h"
#include "compteur.h"

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
            {D[j]="#00ff00";}
        if(C%2==1)
            {D[j]="#0000ff";}
        C++;}
       }
    statesChanged();
}

void jeu::deplacement(int x, int y) {
    // On transmet les coordonées du carré sur lequel on a cliqué.

    // Cette fonction n'intervient qu'après le tour 6.
    if (C>=6){

    // Si on a déjà sélectionné la case à bouger
    if(CasePrecedente[1]!=-1){

        // Si la case à bouger n'est pas celle que l'on a sélectionnée auparavant
        if (CasePrecedente[0]!=x || CasePrecedente[1]!=y){

            // On stock les coordonnées de la case précédente dans des variables
            // pour plus de practicité
           int xprecedent, yprecedent;
           xprecedent=CasePrecedente[0];
           yprecedent=CasePrecedente[1];

       // Si c'est au tour du joueur 1
       // Il faut qu'il ait sélectionné auparavant une case lui appartenant
       if (C%2==0 && D[3*xprecedent+yprecedent]=="#00ff00"){

              // S'il clique sur une case libre qui est voisine de la sienne
              if (D[3*x+y]=="#000000" && std::abs(x-xprecedent)<=1 && std::abs(y-yprecedent)<=1){

                  // On colorie la nouvelle case avec la couleur du joueur 1 et l'ancienne devient libre (noire)
                  D[3*x+y]="#00ff00";
                  D[3*xprecedent+yprecedent]="#000000";

                  // On remet le vecteur CasePrecedente "à 0" pour demander une nouvelle séleciton de case
                  CasePrecedente[0]=-1;
                  CasePrecedente[1]=-1;

                  // Le déplacement ayant fonctionné, on peut passer au joueur suivant
                  C++;
              }
        }

       // Si c'est au tour du joueur 2
       // Il faut qu'il ait sélectionné aupravant une case lui appartenant
       if (C%2==1 && D[3*xprecedent+yprecedent]=="#0000ff"){

              // S'il clique sur une case livre et voisine de la sienne
              if (D[3*x+y]=="#000000" && std::abs(x-xprecedent)<=1 && std::abs(y-yprecedent)<=1){

                  // On colorie la nouvelle case avec la couleur du joueur 2 et l'ancienne devient libre (noire)
                  D[3*x+y]="#0000ff";
                  D[3*xprecedent+yprecedent]="#000000";

                  // On remet le vecteur CasePrecedente "à 0" pour demander une nouvelle sélection de case
                  CasePrecedente[0]=-1;
                  CasePrecedente[1]=-1;

                  // Le déplacement ayant fonctionné, on peut passer au joueur suivant
                  C++;
              }
        }
        }
    }

    /*Si on vient de faire un déplacement ou que l'on commence le tour 7, alors on stock les valeurs x et y dans
      la variable CasePrecedente.*/

    else {CasePrecedente[0]=x;
        CasePrecedente[1]=y;}
}
    statesChanged();
}
