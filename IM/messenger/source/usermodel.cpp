#include "messenger/usermodel.h"

UserObject::UserObject(const QString &nickname)
    : m_nickname(nickname)
    , m_timout(7)
{
}

QString UserObject::nickname() const
{
    return m_nickname;
}


void UserObject::resetTimout()
{
    m_timout = 7;
}

bool UserObject::isAlive() const
{
    return (m_timout >= 0);
}

void UserObject::decrementTimeout()
{
    m_timout--;
}

//===================================

UserModel::UserModel(QObject *parent) :
    QAbstractListModel(parent)
  , m_UserList()
{
}

int UserModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent);
    return m_UserList.count();
}

void UserModel::addUser(const QString &nickname)
{
    bool found = false;

    for (int i = 0; i < m_UserList.size(); ++i) {
        if (m_UserList.at(i)->nickname() == nickname)
        {
            found = true;
            m_UserList.at(i)->resetTimout();
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

void UserModel::removeUser(const QString &nickname)
{
    for (int index = 0; index < m_UserList.size(); index++) {
        if (m_UserList.at(index)->nickname() == nickname)
        {
            beginRemoveRows(QModelIndex(), index, index);
            UserObject* userToRemove = m_UserList.takeAt(index);
            delete userToRemove;
            endRemoveRows();
            break;
        }
    }
}

QVariant UserModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_UserList.count())
        return QVariant();

    const  UserObject*  user = m_UserList[index.row()];
    if (role == NicknameRole)
        return user->nickname();
    return QVariant();
}


QHash<int, QByteArray> UserModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[NicknameRole] = "nickname";
    return roles;
}

void UserModel::decrementTimeout()
{
    for(auto user: m_UserList) {
        user->decrementTimeout();
        if(!user->isAlive()) {
            removeUser(user->nickname());
        }
    }
}

