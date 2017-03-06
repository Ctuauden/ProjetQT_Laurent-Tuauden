import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 330
    height: 330
    title: qsTr("Transtions")


    MainForm {
        anchors.fill: parent
        id: page
        mouseArea {
            onClicked: stateGroup.state=''
        }
        mouseArea1 {
            onClicked: stateGroup.state='State1'
        }
        mouseArea2 {
            onClicked: stateGroup.state='State2'
        }

    }

    StateGroup {
        id: stateGroup;
        states:[
            State {
                name: "State1"

                PropertyChanges {
                    target: page.icon;
                    x: page.middleRightRect.x;
                    y: page.middleRightRect.y;

                }
            },
            State {
                name: "State2"

                PropertyChanges {
                    target: page.icon;
                    x: page.bottomLeftRect.x;
                    y: page.bottomLeftRect.y;

                }
            }

        ]
        transitions: [
                     Transition {
                     from: "*"; to: "State1"
                        NumberAnimation {
                            easing.type: Easing.InQuad
                            properties: "x,y";
                            duration: 1000
                                      }
                                  },
                     Transition {
                     from: "*"; to: "State2"
                        NumberAnimation {
                            properties: "x,y";
                            easing.type: Easing.InOutQuad;
                            duration: 2000
                                         }
                                     },
            Transition {
                                           NumberAnimation {
                                               properties: "x,y";
                                               duration: 200
                                           }
                                       }
                                  ]
    }
}
