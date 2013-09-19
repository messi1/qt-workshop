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
#include "messenger/usermodel.h"


namespace IM {

Application::Application()
{
}

int Application::execute(int argc, char * argv[])
{
    QGuiApplication application(argc, argv);
    QQuickView view;

    QQmlContext *context = view.rootContext();

    MessageModel messageModel;
    context->setContextProperty("messageModel", &messageModel);

    UserModel userModel;
    context->setContextProperty("userModel", &userModel);

    Controller* controller = new Controller;
    view.engine()->rootContext()->setContextProperty("controller", controller);

    UdpSocket udpSocket;
    Communication *communication = new Communication(&udpSocket);
    udpSocket.bind(QHostAddress::Broadcast, communication->getPort());
    QObject::connect(controller, SIGNAL(send_message(const QString &, const QString &)), communication, SLOT(handle_send_message(const QString &, const QString &)));
    QObject::connect(controller, SIGNAL(send_keepAlive(const QString&)), communication, SLOT(handle_send_keepAlive(const QString&)));
    QObject::connect(communication, SIGNAL(receivedMessage(QString,QString)), &messageModel, SLOT(addMessage(QString,QString)));
    QObject::connect(communication, SIGNAL(receivedKeepAlive(QString)), &userModel, SLOT(addUser(QString)));
    QObject::connect(&udpSocket, SIGNAL(datagramReceived(QByteArray&)), communication, SLOT(handle_recv_message(QByteArray&)));

    view.connect(view.engine(), SIGNAL(quit()), SLOT(close()));
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/IM/main.qml"));
    view.show();

    return application.exec();
}

} // IM

