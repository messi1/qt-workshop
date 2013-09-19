#include <QtCore/QDataStream>
#include <QtNetwork/QHostAddress>

#include "messenger/iudp_socket.h"
#include "messenger/communication.h"

namespace IM {

quint32 const Command::KeepAlive = 0;
quint32 const Command::Message = 1;
quint32 const Command::HostEvent = 2;
quint32 const Command::ParticipateInEvent = 3;
quint32 const Command::CallOutEvent = 4;


Communication::Communication(IUdpSocket & udp_socket) :
    _udp_socket(udp_socket),
    _port(41000)
{
}

void Communication::handle_send_keepAlive(QString const & nickname)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::KeepAlive;
    stream << nickname;

    _udp_socket.writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_send_message(const QString & nickname, const QString & message)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::Message;
    stream << nickname;
    stream << message;

    _udp_socket.writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_send_hostEvent(const QString & nickname, const QString & title)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::HostEvent;
    stream << nickname;
    stream << title;

    _udp_socket.writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_send_participateInEvent(QString const & nickname, QString const & title)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::ParticipateInEvent;
    stream << nickname;
    stream << title;

    _udp_socket.writeDatagram(data, QHostAddress::Broadcast, _port);
}

void Communication::handle_send_callOutEvent(QString const & nickname, QString const & title)
{
    QByteArray data;
    QDataStream stream(&data, QIODevice::WriteOnly);
    stream.setVersion(QDataStream::Qt_5_0);

    stream << Command::CallOutEvent;
    stream << nickname;
    stream << title;

    _udp_socket.writeDatagram(data, QHostAddress::Broadcast, _port);
}

} // IM

