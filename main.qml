import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 700
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
        id : page
        mouseAreaTL {
            onClicked: if (stateGroup.state=='StateMM' || stateGroup.state=='StateML' || stateGroup.state=='StateTM' || stateGroup.state=='')
                       {stateGroup.state='StateTL'}
        }
        mouseAreaTM {
            onClicked: if (stateGroup.state=='StateMM' || stateGroup.state=='StateTR' || stateGroup.state=='StateTL' || stateGroup.state=='' )
                       {stateGroup.state='StateTM'}
        }
        mouseAreaTR {
            onClicked: if (stateGroup.state=='StateMM' || stateGroup.state=='StateMR' || stateGroup.state=='StateTM' ||  stateGroup.state=='' )
                       {stateGroup.state='StateTR'}
        }
        mouseAreaML {
            onClicked: if (stateGroup.state=='StateMM' || stateGroup.state=='StateTL' || stateGroup.state=='StateBL' ||  stateGroup.state=='' )
                       {stateGroup.state='StateML'}
        }
        mouseAreaMM {
            onClicked: if (stateGroup.state=='StateML' || stateGroup.state=='StateMR' || stateGroup.state=='StateTL' || stateGroup.state=='StateTM' || stateGroup.state=='StateTR' || stateGroup.state=='StateBL' || stateGroup.state=='StateBM' || stateGroup.state=='StateBR' || stateGroup.state=='' )
                        {stateGroup.state='StateMM'}
        }
        mouseAreaMR {
            onClicked: if (stateGroup.state=='StateMM' || stateGroup.state=='StateTR' || stateGroup.state=='StateBR' ||  stateGroup.state=='' )
                {stateGroup.state='StateMR'}
        }
        mouseAreaBL {
            onClicked: if (stateGroup.state=='StateMM' || stateGroup.state=='StateML' || stateGroup.state=='StateBM' ||  stateGroup.state=='' )
            {stateGroup.state='StateBL'}
        }
        mouseAreaBM {
            onClicked: if (stateGroup.state=='StateMM' ||  stateGroup.state=='StateBL' || stateGroup.state=='StateBR'||  stateGroup.state=='' )
            {stateGroup.state='StateBM'}
        }
        mouseAreaBR {
            onClicked: if (stateGroup.state=='StateMM' || stateGroup.state=='StateMR' || stateGroup.state=='StateBM' ||  stateGroup.state=='' )
            {stateGroup.state='StateBR'}
        }
    }


    StateGroup {
        id: stateGroup;
        states:[
            State {
                name: "StateTL"

                PropertyChanges {
                    target: page.rect;
                    x: page.topL.x;
                    y: page.topL.y;

                }
            },
            State {
                name: "StateTM"

                PropertyChanges {
                    target: page.rect;
                    x: page.topM.x;
                    y: page.topM.y;
                }
            },
            State {
                    name: "StateTR"

                    PropertyChanges {
                        target: page.rect;
                        x: page.topR.x;
                        y: page.topR.y;
                }
        },
            State {
                name: "StateML"

                PropertyChanges {
                    target: page.rect;
                    x: page.midL.x;
                    y: page.midL.y;

                }
            },
            State {
                name: "StateMM"

                PropertyChanges {
                    target: page.rect;
                    x: page.midM.x;
                    y: page.midM.y;
                }
            },

            State {
                name: "StateMR"

                PropertyChanges {
                    target: page.rect;
                    x: page.midR.x;
                    y: page.midR.y;
                }
            },

            State {
                    name: "StateBL"

                    PropertyChanges {
                        target: page.rect;
                        x: page.botL.x;
                        y: page.botL.y;
                }
        },
            State {
                    name: "StateBM"

                    PropertyChanges {
                        target: page.rect;
                        x: page.botM.x;
                        y: page.botM.y;
                }
        },
            State {
                    name: "StateBR"

                    PropertyChanges {
                        target: page.rect;
                        x: page.botR.x;
                        y: page.botR.y;
                }
        }

        ]
        transitions: [
                     Transition {
                     from: "*"; to: "StateTL"
                        NumberAnimation {
                            easing.type: Easing.InOutQuad
                            properties: "x,y";
                            duration: 1000
                                      }
                                  },
                     Transition {
                     from: "*"; to: "StateTM"
                        NumberAnimation {
                            properties: "x,y";
                            easing.type: Easing.InOutQuad;
                            duration: 1000
                                         }
                                     },
                     Transition {
                     from: "*"; to: "StateTR"
                        NumberAnimation {
                            properties: "x,y";
                            easing.type: Easing.InOutQuad;
                            duration: 1000
                                }
                            },
            Transition {
            from: "*"; to: "StateML"
               NumberAnimation {
                   properties: "x,y";
                   easing.type: Easing.InOutQuad;
                   duration: 1000
                       }
                   },
            Transition {
            from: "*"; to: "StateMM"
               NumberAnimation {
                   properties: "x,y";
                   easing.type: Easing.InOutQuad;
                   duration: 1000
                       }
                   },
            Transition {
            from: "*"; to: "StateMR"
               NumberAnimation {
                   properties: "x,y";
                   easing.type: Easing.InOutQuad;
                   duration: 1000
                       }
                   },
            Transition {
            from: "*"; to: "StateBL"
               NumberAnimation {
                   properties: "x,y";
                   easing.type: Easing.InOutQuad;
                   duration: 1000
                       }
                   },
            Transition {
            from: "*"; to: "StateBM"
               NumberAnimation {
                   properties: "x,y";
                   easing.type: Easing.InOutQuad;
                   duration: 1000
                       }
                   },
            Transition {
            from: "*"; to: "StateBR"
               NumberAnimation {
                   properties: "x,y";
                   easing.type: Easing.InOutQuad;
                   duration: 1000
                       }
                   }


                                  ]
    }
    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }
    }
}
