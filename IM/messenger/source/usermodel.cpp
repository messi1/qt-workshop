#include "messenger/usermodel.h"

UserObject::UserObject(const QString &nickname, QObject *parent)
    : m_nickname(nickname)
{
}

QString UserObject::nickname() const
{
    return m_nickname;
}

//===================================

UserModel::UserModel(QObject *parent) :
    QAbstractListModel(parent)
  , m_UserList()
{
}

int UserModel::rowCount(const QModelIndex& parent) const
{
    return m_UserList.count();
}

void UserModel::addUser(const QString &nickname)
{
    bool found = false;

    for (int i = 0; i < m_UserList.size(); ++i) {
        if (m_UserList.at(i)->nickname() == nickname)
        {
            found = true;
            break;
        }
    }

    if(!found)
    {
        beginInsertRows(QModelIndex(), rowCount(), rowCount());
        m_UserList.push_back(new UserObject(nickname));
        endInsertRows();
    }
}

QVariant UserModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_UserList.count())
        return QVariant();

    const  UserObject*  user = m_UserList[index.row()];
    if (role == NicknameRole)
        return user->nickname();
//    else if (role == MessageRole)
//        return message->message();
    return QVariant();
}


//![0]
QHash<int, QByteArray> UserModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NicknameRole] = "nickname";
    return roles;
}
//![0]
