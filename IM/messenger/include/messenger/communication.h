#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <QtCore/QObject>

namespace IM {

class IUdpSocket;

class Command {
public:
    static quint32 const KeepAlive;
    static quint32 const Message;
    static quint32 const HostEvent;
    static quint32 const ParticipateInEvent;
    static quint32 const CallOutEvent;
};

class Communication : public QObject
{
    Q_OBJECT
public:
    Communication(IUdpSocket* udp_socket);
    quint16 getPort() const {return _port;}

public slots:
    void handle_send_keepAlive(QString const & nickname);
    void handle_send_message(QString const & nickname, QString const & message);
    void handle_send_hostEvent(QString const & nickname, QString const & title);
    void handle_send_participateInEvent(QString const & nickname, QString const & title);
    void handle_send_callOutEvent(QString const & nickname, QString const & title);
    void handle_recv_message(QByteArray &message);

signals:
    void receivedMessage(const QByteArray& message);
    void receivedKeepAlive(const QString& nickname);
    void receivedMessage(const QString& nickname, const QString& message);
    void receivedHostEvent(const QString& nickname, const QString& message);
    void receivedParicipateInEvent(const QString& nickname, const QString& message);
    void receivedCallOutEvent(const QString& nickname, const QString& message);

private:
    IUdpSocket* _udp_socket;
    quint16 _port;
};

} // IM

#endif // COMMUNICATION_H
