#ifndef CONTROLLER_TEST_H
#define CONTROLLER_TEST_H

#include <QtCore/QObject>

class ControllerTest : public QObject
{
    Q_OBJECT

private slots:
    void verify_receiving_of_keepAlive_when_user_is_not_defined_after_6_seconds();
    void verify_receiving_of_keepAlive_when_user_is_defined_after_1_seconds();
    void verify_receiving_of_keepAlive_when_user_is_defined_after_6_seconds();
    void verify_stop_receiving_of_keepAlive_when_user_is_deleted();
    void invoke_send_message_sends_signal_send_message();
    void invoke_send_hostEvent_sends_signal_send_hostEvent();
    void invoke_send_partecipateInEvent_sends_signal_send_partecipateInEvent();
    void invoke_send_callOutEvent_sends_signal_send_callOutEvent();

    void verify_nickname_after_set_it();
};

#endif // CONTROLLER_TEST_H
