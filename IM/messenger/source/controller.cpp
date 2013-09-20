#include "messenger/controller.h"

namespace IM {

Controller::Controller() :
    _nickname(""),
    timerKeepAlive(NULL),

    settings("bbv", "messenger")
    //settings()
{
//    QCoreApplication::setOrganizationName("bbv");
//    QCoreApplication::setOrganizationDomain("bbv.ch");
//    QCoreApplication::setApplicationName("Messenger");
    _nickname = settings.value("nickname/name", "").toString();

    timerKeepAlive = new QTimer(this);
    connect(timerKeepAlive, SIGNAL(timeout()), this, SLOT(invoke_send_keepAlive()));
    timerKeepAlive->start(5000);
}

void Controller::invoke_send_keepAlive()
{
    if (_nickname.isEmpty() == false)
        emit send_keepAlive(_nickname);
}

void Controller::invoke_send_message(const QString & message)
{
    qDebug("Received invoke_send_message event. Message = %s", message.toLatin1().data());
    emit send_message(_nickname, message);
}

void Controller::invoke_send_hostEvent(const QString & title)
{
    qDebug("Received invoke_send_hostEvent event. Event title = %s", title.toLatin1().data());
    emit send_hostEvent(_nickname, title);
}

void Controller::invoke_send_participateInEvent (const QString & title)
{
    emit send_participateInEvent(_nickname, title);
}

void Controller::invoke_send_callOutEvent(const QString & title)
{
    emit send_callOutEvent(_nickname, title);
}

QString Controller::get_nickname()
{
    return _nickname;
}

void Controller::set_nickname(const QString & nickname)
{
    timerKeepAlive->stop();
    emit(before_change_nickname(_nickname));
    _nickname = nickname;

    invoke_send_keepAlive();
    timerKeepAlive->start();

    settings.setValue("nickname/name", _nickname);

}

} // IM

