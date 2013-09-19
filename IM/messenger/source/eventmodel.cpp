#include <QDataStream>
#include "messenger/eventmodel.h"

EventObject::EventObject(const QString &eventname, QObject *parent)
    : m_eventname(eventname)
{
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
    return m_EventList.count();
}

void EventModel::addEvent(const QString &eventname)
{
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_EventList.push_back(new EventObject(eventname));
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

