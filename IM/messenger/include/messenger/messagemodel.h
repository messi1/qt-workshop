#ifndef MESSAGEMODEL_H
#define MESSAGEMODEL_H

#include <QAbstractListModel>
#include <QObject>
#include <QStringList>


class MessageObject
{

public:
    MessageObject(const QString &nickname, const QString &message, QObject *parent=0);

    QString nickname() const;
    QString message() const;

private:
    QString m_nickname;
    QString m_message;
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
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;    

public slots:
    void addMessage(const QString &nickname, const QString &message);

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<MessageObject*> m_MessageList;
};



#endif // MESSAGEMODEL_H
