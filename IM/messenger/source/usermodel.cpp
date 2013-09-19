#include "messenger/usermodel.h"

UserObject::UserObject(const QString &nickname, QObject *parent)
    : m_nickname(nickname)
    , m_timout(7)
{
    Q_UNUSED(parent);
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
  , m_TimeoutTimer()
{
    m_TimeoutTimer.setInterval(1000);
    connect(&m_TimeoutTimer, SIGNAL(timeout()), this, SLOT(decrementTimeout()));
    m_TimeoutTimer.start();
}

UserModel::~UserModel()
{
    m_TimeoutTimer.stop();
    disconnect();
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
    for(quint16 index = 0; index < m_UserList.count(); index++) {
        m_UserList.at(index)->decrementTimeout();
        if(!m_UserList.at(index)->isAlive()) {
            removeUser(m_UserList.at(index)->nickname());
        }
    }
}

