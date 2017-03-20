#ifndef JEU_H
#define JEU_H

#include <QObject>
#include <QList>

#include <iostream>
using namespace std;

#include<QColor>

class jeu : public QObject
{
    Q_OBJECT
public:
    explicit jeu(QObject *parent = 0);
    Q_INVOKABLE void Init(QString value="#000000");
/*    Q_INVOKABLE void Set(int x, int y, int value);
    Q_INVOKABLE void Print();
    Q_INVOKABLE int Get(int x, int y);*/

    Q_PROPERTY(QList<QString> states READ readStates NOTIFY statesChanged);

    QList<QString> readStates();

    Q_INVOKABLE void changement(int j);

signals:
    void statesChanged();

public slots:

private:
    QList<QString> D;
    int C;
};

#endif // JEU_H
