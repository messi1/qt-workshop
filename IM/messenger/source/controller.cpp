#include "messenger/controller.h"

namespace IM {

Controller::Controller() :
    _nickname("")
{
}

void Controller::invoke_send_keepAlive()
{
    emit send_keepAlive(_nickname);
}

void Controller::invoke_send_message(const QString & message)
{
    emit send_message(_nickname, message);
}

void Controller::invoke_send_hostEvent(const QString & title)
{
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

void Controller::set_nickname(const QString & nickname)
{
    _nickname = nickname;
}

} // IM

