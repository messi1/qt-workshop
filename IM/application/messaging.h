#ifndef MESSAGING_H
#define MESSAGING_H

#include <QtNetwork/QUdpSocket>

namespace Command {
    static quint32 const KeepAlive = 0;
    static quint32 const Message = 1;

}

class Messaging : public QObject
{
    Q_OBJECT

public:
    Messaging();

public slots:
    void start();
    void broadcast();
    void readDatagrams();

    //void send_message(QString message);



// new interface
//
// qml > ui_controller > messaging > transport
public slots:
    void send_message(QString message);

signals:
    void send(QByteArray data);

private:
    QUdpSocket _udpSocket;
};

#endif // MESSAGING_H