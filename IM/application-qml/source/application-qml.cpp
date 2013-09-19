#include <QtGui/QGuiApplication>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>

#include <QThread>

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
    Communication *communication = new Communication(udpSocket);
    communication->connect(&controller, SIGNAL(send_message(const QString &, const QString &)), SLOT(handle_send_message(const QString &, const QString &)));

    QThread* thread = new QThread;
    communication->moveToThread(thread);
    //QObject::connect(communication, SIGNAL(error(QString)), this, SLOT(errorString(QString)));
    //QObject::connect(thread, SIGNAL(started()), communication, SLOT(process()));
    //QObject::connect(communication, SIGNAL(finished()), thread, SLOT(quit()));
    //QObject::connect(communication, SIGNAL(finished()), communication, SLOT(deleteLater()));
    QObject::connect(thread, SIGNAL(finished()), thread, SLOT(deleteLater()));
    thread->start();

    view.connect(view.engine(), SIGNAL(quit()), SLOT(close()));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    QQmlContext *context = view.rootContext();

    MessageModel messageModel;
    context->setContextProperty("messageModel", &messageModel);
    QObject::connect(&controller, SIGNAL(send_message(QString,QString)), &messageModel, SLOT(addMessage(QString,QString)));


    view.setSource(QUrl("qrc:/IM/main.qml"));
    view.show();

    return application.exec();
}

} // IM

