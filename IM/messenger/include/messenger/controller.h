#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QtCore/QObject>
#include <QtCore/QTimer>

namespace IM {

class Controller : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString setNickName READ get_nickname WRITE set_nickname)

public:
    Controller();

public slots:
    QString get_nickname();
    void set_nickname(const QString & nickname);
    void invoke_send_message(const QString & message);
    void invoke_send_hostEvent(const QString & title);
    void invoke_send_participateInEvent (const QString & title);
    void invoke_send_callOutEvent(const QString & title);

signals:
    void send_keepAlive(const QString & nickname);
    void send_message(const QString & nickname, QString const & message);
    void send_hostEvent(const QString & nickname, QString const & title);
    void send_participateInEvent (const QString & nickname, QString const & title);
    void send_callOutEvent(const QString & nickname, QString const & title);

private slots:
    void invoke_send_keepAlive();

private:
    QString _nickname;

    QTimer* timerKeepAlive;
};

} // IM

#endif // CONTROLLER_H
