#ifndef MESSAGEMODEL_H
#define MESSAGEMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <QStringList>


class MessageObject
{

public:
    MessageObject(const QString &nickname, const QString &message);

    QString nickname() const;
    QString message() const;
    void setNickname(const QString &name);

private:
    QString m_nickname;
    QString m_message;
    bool m_myMessage;
};


class MessageModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum MessageRoles {
        NicknameRole = Qt::UserRole + 1,
        MessageRole
    };
    MessageModel(QObject *parent = 0);

    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;    

public slots:
    int  rowCount(const QModelIndex &parent = QModelIndex()) const;
    void addMessage(const QString &nickname, const QString &message);
    int  messageCount() const;
    void changeNicknameOfMyMessages(const QString& oldNickname, const QString& newNickname);

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<MessageObject*> m_MessageList;
};



#endif // MESSAGEMODEL_H

