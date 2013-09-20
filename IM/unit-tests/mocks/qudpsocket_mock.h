#ifndef QUDPSOCKET_MOCK_H
#define QUDPSOCKET_MOCK_H

#include <QtCore/QObject>
#include <QtNetwork/QHostAddress>

#include "messenger/iudp_socket.h"

class QUdpSocketMock : public IM::IUdpSocket
{
    Q_OBJECT

public:
    qint64 writeDatagram(QByteArray const & datagram, QHostAddress const & host, quint16 port);
    virtual bool bind ( const QHostAddress & address, quint16 port){return true;}

signals:
    void called_writeDatagram(QByteArray const & datagram, QHostAddress const & host, quint16 port);
};

Q_DECLARE_METATYPE(QHostAddress);

#endif // QUDPSOCKET_MOCK_H
