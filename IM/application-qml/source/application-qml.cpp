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
    QQmlContext *context = view.rootContext();

    MessageModel messageModel;
    context->setContextProperty("messageModel", &messageModel);
    QObject::connect(&controller, SIGNAL(send_message(QString,QString)), &messageModel, SLOT(addMessage(QString,QString)));


    view.setSource(QUrl("qrc:/IM/main.qml"));
    view.show();

    return application.exec();
}

} // IM

