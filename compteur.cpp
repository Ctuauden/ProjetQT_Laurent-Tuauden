#include "compteur.h"

Compteur::Compteur(QObject *parent) : QObject(parent)
{
    fCompteur=0;
    cptChanged();
}

QString Compteur::readCompteur()
{
    return QString::number(fCompteur%2+1);
}

void Compteur::increment() {
    fCompteur++;
    cptChanged();
}
