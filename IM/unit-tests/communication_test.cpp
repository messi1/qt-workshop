#include <QtTest/QTest>
#include <QtTest/QSignalSpy>

#include <messenger/communication.h>

#include "mocks/qudpsocket_mock.h"
#include "communication_test.h"

static QString const expected_nickname = "Name";
static QString const expected_message = "Hello world.";
static QString const expected_titleEvent = "Beer";

void CommunicationTest::handle_send_keepAlive_broadcasts_the_keepAlive_over_udp()
{
    // arrange
    qRegisterMetaType<QHostAddress>("QHostAddress");
    QUdpSocketMock udp_socket;
    QSignalSpy writeDatagram(&udp_socket, SIGNAL(called_writeDatagram(QByteArray const &, QHostAddress const &, quint16)));

    // act
    IM::Communication testee(udp_socket);
    testee.handle_send_keepAlive(expected_nickname);

    // assert
    QCOMPARE(writeDatagram.count(), 1);

    const auto arguments = writeDatagram.takeFirst();
    QDataStream data(arguments.at(0).toByteArray());

    quint32 command;
    QString nickname;
    data >> command >> nickname;

    const quint32 expected_command = IM::Command::KeepAlive;
    QCOMPARE(command, expected_command);
    QCOMPARE(nickname, expected_nickname);

    const QHostAddress expected_address = QHostAddress::Broadcast;
    QCOMPARE(qvariant_cast<QHostAddress>(arguments.at(1)), expected_address);

    const quint32 expected_port = 41000;
    QCOMPARE(arguments.at(2).toUInt(), expected_port);
}

void CommunicationTest::handle_send_message_broadcasts_the_message_over_udp()
{
    // arrange
    qRegisterMetaType<QHostAddress>("QHostAddress");
    QUdpSocketMock udp_socket;
    QSignalSpy writeDatagram(&udp_socket, SIGNAL(called_writeDatagram(QByteArray const &, QHostAddress const &, quint16)));

    // act
    IM::Communication testee(udp_socket);
    testee.handle_send_message(expected_nickname, expected_message);

    // assert
    QCOMPARE(writeDatagram.count(), 1);

    const auto arguments = writeDatagram.takeFirst();
    QDataStream data(arguments.at(0).toByteArray());

    quint32 command;
    QString nickname;
    QString message;
    data >> command >> nickname >> message;

    const quint32 expected_command = IM::Command::Message;
    QCOMPARE(command, expected_command);
    QCOMPARE(nickname, expected_nickname);
    QCOMPARE(message, expected_message);

    const QHostAddress expected_address = QHostAddress::Broadcast;
    QCOMPARE(qvariant_cast<QHostAddress>(arguments.at(1)), expected_address);

    const quint32 expected_port = 41000;
    QCOMPARE(arguments.at(2).toUInt(), expected_port);
}

void CommunicationTest::handle_send_hostEvent_broadcasts_the_hostEvent_over_udp()
{
    // arrange
    qRegisterMetaType<QHostAddress>("QHostAddress");
    QUdpSocketMock udp_socket;
    QSignalSpy writeDatagram(&udp_socket, SIGNAL(called_writeDatagram(QByteArray const &, QHostAddress const &, quint16)));

    // act
    IM::Communication testee(udp_socket);
    testee.handle_send_hostEvent(expected_nickname, expected_titleEvent);

    // assert
    QCOMPARE(writeDatagram.count(), 1);

    const auto arguments = writeDatagram.takeFirst();
    QDataStream data(arguments.at(0).toByteArray());

    quint32 command;
    QString nickname;
    QString eventTitle;
    data >> command >> nickname >> eventTitle;

    const quint32 expected_command = IM::Command::HostEvent;
    QCOMPARE(command, expected_command);
    QCOMPARE(nickname, expected_nickname);
    QCOMPARE(eventTitle, expected_titleEvent);

    const QHostAddress expected_address = QHostAddress::Broadcast;
    QCOMPARE(qvariant_cast<QHostAddress>(arguments.at(1)), expected_address);

    const quint32 expected_port = 41000;
    QCOMPARE(arguments.at(2).toUInt(), expected_port);
}


void CommunicationTest::handle_send_partecipateInEvent_broadcasts_the_hostEvent_over_udp()
{
    // arrange
    qRegisterMetaType<QHostAddress>("QHostAddress");
    QUdpSocketMock udp_socket;
    QSignalSpy writeDatagram(&udp_socket, SIGNAL(called_writeDatagram(QByteArray const &, QHostAddress const &, quint16)));

    // act
    IM::Communication testee(udp_socket);
    testee.handle_send_participateInEvent(expected_nickname, expected_titleEvent);

    // assert
    QCOMPARE(writeDatagram.count(), 1);

    const auto arguments = writeDatagram.takeFirst();
    QDataStream data(arguments.at(0).toByteArray());

    quint32 command;
    QString nickname;
    QString eventTitle;
    data >> command >> nickname >> eventTitle;

    const quint32 expected_command = IM::Command::ParticipateInEvent;
    QCOMPARE(command, expected_command);
    QCOMPARE(nickname, expected_nickname);
    QCOMPARE(eventTitle, expected_titleEvent);

    const QHostAddress expected_address = QHostAddress::Broadcast;
    QCOMPARE(qvariant_cast<QHostAddress>(arguments.at(1)), expected_address);

    const quint32 expected_port = 41000;
    QCOMPARE(arguments.at(2).toUInt(), expected_port);
}

void CommunicationTest::handle_send_callOutEvent_broadcasts_the_hostEvent_over_udp()
{
    // arrange
    qRegisterMetaType<QHostAddress>("QHostAddress");
    QUdpSocketMock udp_socket;
    QSignalSpy writeDatagram(&udp_socket, SIGNAL(called_writeDatagram(QByteArray const &, QHostAddress const &, quint16)));

    // act
    IM::Communication testee(udp_socket);
    testee.handle_send_callOutEvent(expected_nickname, expected_titleEvent);

    // assert
    QCOMPARE(writeDatagram.count(), 1);

    const auto arguments = writeDatagram.takeFirst();
    QDataStream data(arguments.at(0).toByteArray());

    quint32 command;
    QString nickname;
    QString eventTitle;
    data >> command >> nickname >> eventTitle;

    const quint32 expected_command = IM::Command::CallOutEvent;
    QCOMPARE(command, expected_command);
    QCOMPARE(nickname, expected_nickname);
    QCOMPARE(eventTitle, expected_titleEvent);

    const QHostAddress expected_address = QHostAddress::Broadcast;
    QCOMPARE(qvariant_cast<QHostAddress>(arguments.at(1)), expected_address);

    const quint32 expected_port = 41000;
    QCOMPARE(arguments.at(2).toUInt(), expected_port);
}
