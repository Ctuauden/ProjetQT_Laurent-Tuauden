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
    if(C<6){
    if(D[j]=="#000000"){         // si la case est noire (pas déjà occupée)
        if(C%2==0)
        {D[j]="#00ff00";}
        if(C%2==1)
        {D[j]="#0000ff";}}}
    //else
    C++;
    statesChanged();
}
