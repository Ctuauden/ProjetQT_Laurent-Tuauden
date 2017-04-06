#ifndef JEU_H
#define JEU_H

#include <QObject>
#include <QList>

#include <iostream>
using namespace std;

class jeu : public QObject
{
    Q_OBJECT
public:
    // compteur
    /*Q_INVOKABLE void increment();*/

    Q_PROPERTY(QString cptQML READ readCompteur NOTIFY cptChanged);

    QString readCompteur();

    // jeu
    explicit jeu(QObject *parent = 0);
    Q_INVOKABLE void Init(QString value="#000000");

    Q_PROPERTY(QList<QString> states READ readStates NOTIFY statesChanged);

    QList<QString> readStates();

    Q_INVOKABLE void changement(int j);
    Q_INVOKABLE void deplacement(int x, int y);

    Q_INVOKABLE void test_victoire(); //c
    Q_INVOKABLE int get_victoire();  //c
    Q_INVOKABLE void nouvelle_partie();  //c
    Q_INVOKABLE void changement_couleur(int j, QString couleur);


signals:
    void statesChanged();
    void cptChanged();

public slots:

private:
    int fCompteur;
    vector<int> CasePrecedente;
    QList<QString> D;
    int C;
    int victoire=0; //c

    QString couleurj1;
    QString couleurj2;
};

#endif // JEU_H
