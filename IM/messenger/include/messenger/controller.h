#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QtCore/QObject>
#include <QtCore/QTimer>

namespace IM {

class Controller : public QObject
{
    Q_OBJECT
public:
    Controller();

    void set_nickname(const QString & nickname);

public slots:
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
