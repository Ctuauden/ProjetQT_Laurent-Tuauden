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

void jeu::nouvelle_partie(){
    for(int i=0;i<9;i++)
        {D[i]="#000000";}
    C=0;
    victoire=0;
    statesChanged();
}

QList<QString> jeu::readStates()
{
    return D;
}

//c :
void jeu::test_victoire(){

    // joueur 1 gagne
    if(D[0]=="#00ff00" && D[1]=="#00ff00" && D[2]=="#00ff00"){
        victoire=1;
        D[0]="#ff0000";D[1]="#ff0000";D[2]="#ff0000";}
    if(D[3]=="#00ff00" && D[4]=="#00ff00" && D[5]=="#00ff00"){
        victoire=1;
        D[3]="#ff0000";D[4]="#ff0000";D[5]="#ff0000";}
    if(D[6]=="#00ff00" && D[7]=="#00ff00" && D[8]=="#00ff00"){
        victoire=1;
        D[6]="#ff0000";D[7]="#ff0000";D[8]="#ff0000";}
    if(D[0]=="#00ff00" && D[3]=="#00ff00" && D[6]=="#00ff00"){
        victoire=1;
        D[0]="#ff0000";D[3]="#ff0000";D[6]="#ff0000";}
    if(D[1]=="#00ff00" && D[4]=="#00ff00" && D[7]=="#00ff00"){
        victoire=1;
        D[1]="#ff0000";D[4]="#ff0000";D[7]="#ff0000";}
    if(D[2]=="#00ff00" && D[5]=="#00ff00" && D[8]=="#00ff00"){
        victoire=1;
        D[2]="#ff0000";D[5]="#ff0000";D[8]="#ff0000";}
    if(D[0]=="#00ff00" && D[4]=="#00ff00" && D[8]=="#00ff00"){
        victoire=1;
        D[0]="#ff0000";D[4]="#ff0000";D[8]="#ff0000";}
    if(D[2]=="#00ff00" && D[4]=="#00ff00" && D[6]=="#00ff00"){
        victoire=1;
        D[2]="#ff0000";D[4]="#ff0000";D[6]="#ff0000";}

    // joueur 2 gagne
    if(D[0]=="#0000ff" && D[1]=="#0000ff" && D[2]=="#0000ff"){
        victoire=2;
        D[0]="#ff0000";D[1]="#ff0000";D[2]="#ff0000";}
    if(D[3]=="#0000ff" && D[4]=="#0000ff" && D[5]=="#0000ff"){
        victoire=2;
        D[3]="#ff0000";D[4]="#ff0000";D[5]="#ff0000";}
    if(D[6]=="#0000ff" && D[7]=="#0000ff" && D[8]=="#0000ff"){
        victoire=2;
        D[6]="#ff0000";D[7]="#ff0000";D[8]="#ff0000";}
    if(D[0]=="#0000ff" && D[3]=="#0000ff" && D[6]=="#0000ff"){
        victoire=2;
        D[0]="#ff0000";D[3]="#ff0000";D[6]="#ff0000";}
    if(D[1]=="#0000ff" && D[4]=="#0000ff" && D[7]=="#0000ff"){
        victoire=2;
        D[1]="#ff0000";D[4]="#ff0000";D[7]="#ff0000";}
    if(D[2]=="#0000ff" && D[5]=="#0000ff" && D[8]=="#0000ff"){
        victoire=2;
        D[2]="#ff0000";D[5]="#ff0000";D[8]="#ff0000";}
    if(D[0]=="#0000ff" && D[4]=="#0000ff" && D[8]=="#0000ff"){
        victoire=2;
        D[0]="#ff0000";D[4]="#ff0000";D[8]="#ff0000";}
    if(D[2]=="#0000ff" && D[4]=="#0000ff" && D[6]=="#0000ff"){
        victoire=2;
        D[2]="#ff0000";D[4]="#ff0000";D[6]="#ff0000";}
}

int jeu::get_victoire(){
    return victoire;
}

void jeu::changement(int j) {
    if(C<6){
    if(D[j]=="#000000"){         // si la case est noire (pas déjà occupée)
        if(C%2==0)
        {D[j]="#00ff00";
        test_victoire();} //c
        if(C%2==1)
        {D[j]="#0000ff";
        test_victoire();}}} //c
    //else
    C++;
    statesChanged();
}
