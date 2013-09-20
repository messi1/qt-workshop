#include <QtCore/QDataStream>
#include <QtNetwork/QHostAddress>
#include <QTimer>

#include "messenger/iudp_socket.h"
#include "messenger/communication.h"


namespace IM {

quint32 const Command::KeepAlive = 0;
quint32 const Command::Message = 1;
quint32 const Command::HostEvent = 2;
quint32 const Command::ParticipateInEvent = 3;
quint32 const Command::CallOutEvent = 4;


Communication::Communication(IUdpSocket* udp_socket) :
    QObject(),
    _udp_socket(udp_socket),
    _port(41000)
{
    _udp_socket->bind(QHostAddress::Broadcast, _port);
}

void Communication::handle_send_keepAlive(QString const & nickname)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::KeepAlive;
    stream << nickname;

    _udp_socket->writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_send_message(const QString & nickname, const QString & message)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::Message;
    stream << nickname;
    stream << message;

    _udp_socket->writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_send_hostEvent(const QString & nickname, const QString & title)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::HostEvent;
    stream << nickname;
    stream << title;

    _udp_socket->writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_send_participateInEvent(QString const & nickname, QString const & title)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::ParticipateInEvent;
    stream << nickname;
    stream << title;

    _udp_socket->writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_send_callOutEvent(QString const & nickname, QString const & title)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);
    stream << Command::CallOutEvent;
    stream << nickname;
    stream << title;

    _udp_socket->writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_recv_message(QByteArray& msg)
{
    QDataStream stream(&msg, QIODevice::ReadOnly);
    stream.setVersion(QDataStream::Qt_5_0);
    quint32 cmd;
    QString nickname;
    QString message;
    stream >> cmd;
    stream >> nickname;
    stream >> message;

    switch(cmd)
    {
        case Command::KeepAlive:
            // send signal to user model
            emit receivedKeepAlive(nickname);
        break;

        case Command::Message:
            emit receivedMessage(nickname, message );
        break;

        case Command::HostEvent:
            // Received event which will be hosted by
            emit receivedHostEvent( nickname, message );
        break;

        case Command::ParticipateInEvent:
            emit receivedParicipateInEvent( nickname, message );
        break;

        case Command::CallOutEvent:
            emit receivedCallOutEvent( nickname, message );
        break;
    }
}

} // IM

