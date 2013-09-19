#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>

#include <messenger/controller.h>
#include <messenger/communication.h>
#include <messenger/udp_socket.h>

#include "application-qml/application-qml.h"

#include "messenger/messagemodel.h"



namespace IM {

Application::Application()
{
}

int Application::execute(int argc, char * argv[])
{
    QGuiApplication application(argc, argv);
    QQuickView view;

    Controller controller;
    view.engine()->rootContext()->setContextProperty("controller", &controller);

    UdpSocket udpSocket;
    Communication communication(udpSocket);
    communication.connect(&controller, SIGNAL(send_message(const QString &, const QString &)), SLOT(handle_send_message(const QString &, const QString &)));

    view.connect(view.engine(), SIGNAL(quit()), SLOT(close()));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/IM/main.qml"));



    // data model test
    MessageModel messageModel;
    messageModel.addMessage("user1", "hello my friend");
    messageModel.addMessage("user2", "hi dummy");
    messageModel.addMessage("user1", "what");
    messageModel.addMessage("user2", "jellyfish");

    //QList<MessageObject*> messageModel;
    //messageModel.append(new MessageObject("user1", "hello my friend"));
    //messageModel.append(new MessageObject("user2", "hi dummy"));
    //messageModel.append(new MessageObject("user1", "what"));
    //messageModel.append(new MessageObject("user2", "jellyfish"));

    QStringList bla;

    bla << "first";
    bla << "second";

    QQmlContext *ctxt = view.rootContext();
    ctxt->setContextProperty("messageModel", &messageModel);
    // data model


    view.show();

    return application.exec();
}

} // IM

