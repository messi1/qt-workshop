#include <QDataStream>
#include "messenger/messagemodel.h"

MessageObject::MessageObject(const QString &nickname, const QString &message)
    : m_nickname(nickname)
    , m_message(message)
{
}

QString MessageObject::nickname() const
{
    return m_nickname;
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

void MessageModel::addMessage(const QString &nickname, const QString &message)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_MessageList.push_back(new MessageObject(nickname, message));
    //m_animals << animal;
    endInsertRows();
}

QVariant MessageModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_MessageList.count())
        return QVariant();

    const  MessageObject*  message = m_MessageList[index.row()];
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

