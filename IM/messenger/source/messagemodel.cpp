#include <QDataStream>
#include "messenger/messagemodel.h"

MessageObject::MessageObject(const QString &nickname, const QString &message)
    : m_nickname(nickname)
    , m_message(message)
    , m_myMessage(false)
{
}

QString MessageObject::nickname() const
{
    return m_nickname;
}

void MessageObject::setNickname(const QString& name)
{
    m_nickname = name;
}


QString MessageObject::message() const
{
    return m_message;
}


MessageModel::MessageModel(QObject *parent) :
    QAbstractListModel(parent)
  , m_MessageList()
{
}

int MessageModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent);
    return m_MessageList.count();
}


int MessageModel::messageCount() const
{
    return m_MessageList.count();
}

void MessageModel::addMessage(const QString &nickname, const QString &message)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_MessageList.push_front(new MessageObject(nickname, message));
    endInsertRows();
}

void MessageModel::changeNicknameOfMyMessages(const QString& oldNickname, const QString& newNickname)
{
    for(int i=0; i<m_MessageList.length(); ++i)
    {
        if(m_MessageList[i]->nickname()==oldNickname)
            m_MessageList[i]->setNickname(newNickname);
    }

    QModelIndex r1 = index(0);
    QModelIndex r2 = index(4);
    emit dataChanged(r1,r2);
}

QVariant MessageModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_MessageList.count())
        return QVariant();

    const  MessageObject*  message = m_MessageList.first();
    if (role == NicknameRole)
        return message->nickname();
    else if (role == MessageRole)
        return message->message();
    return QVariant();
}


QHash<int, QByteArray> MessageModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NicknameRole] = "nickname";
    roles[MessageRole] = "message";
    return roles;
}

