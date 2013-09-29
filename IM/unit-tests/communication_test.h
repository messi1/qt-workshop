#ifndef COMMUNICATION_TEST_H
#define COMMUNICATION_TEST_H

#include <QObject>

class CommunicationTest : public QObject
{
    Q_OBJECT

private slots:
    void handle_send_keepAlive_broadcasts_the_keepAlive_over_udp();
    void handle_send_message_broadcasts_the_message_over_udp();
    void handle_send_hostEvent_broadcasts_the_hostEvent_over_udp();
    void handle_send_partecipateInEvent_broadcasts_the_hostEvent_over_udp();
    void handle_send_callOutEvent_broadcasts_the_hostEvent_over_udp();

    void handle_receive_keepAlive_message_over_udp();
    void handle_receive_message_message_over_udp();
    void handle_receive_hostEvent_message_over_udp();
    void handle_receive_paricipateInEvent_message_over_udp();
    void handle_receive_callOutEvent_message_over_udp();
};

#endif // COMMUNICATION_TEST_H
