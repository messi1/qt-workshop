#ifndef CONTROLLER_TEST_H
#define CONTROLLER_TEST_H

#include <QtCore/QObject>

class ControllerTest : public QObject
{
    Q_OBJECT

private slots:
    void invoke_send_keepAlive_sends_signal_send_keepAlive();
    void invoke_send_message_sends_signal_send_message();
    void invoke_send_hostEvent_sends_signal_send_hostEvent();
    void invoke_send_partecipateInEvent_sends_signal_send_partecipateInEvent();
    void invoke_send_callOutEvent_sends_signal_send_callOutEvent();
};

#endif // CONTROLLER_TEST_H
