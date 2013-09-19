#include <QDataStream>
#include "messenger/eventmodel.h"

EventObject::EventObject(const QString& nickname, const QString &eventname)
    : m_nickname(nickname)
    , m_eventname(eventname)
{
}

QString EventObject::nickname() const
{
    return m_nickname;
}


QString EventObject::eventname() const
{
    return m_eventname;
}

EventModel::EventModel(QObject *parent) :
    QAbstractListModel(parent)
  , m_EventList()
{
}

int EventModel::rowCount(const QModelIndex& parent) const
{
    Q_UNUSED(parent);
    return m_EventList.count();
}

void EventModel::addEvent(const QString& nickname, const QString &eventname)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_EventList.push_back(new EventObject(nickname, eventname));
    endInsertRows();
}

QVariant EventModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_EventList.count())
        return QVariant();

    const  EventObject*  message = m_EventList[index.row()];
    if (role == EventNameRole)
        return message->eventname();
    return QVariant();
}


QHash<int, QByteArray> EventModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[EventNameRole] = "eventname";
    return roles;
}

