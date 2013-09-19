#ifndef EVENTMODEL_H
#define EVENTMODEL_H


#include <QAbstractListModel>
#include <QObject>
#include <QStringList>


class EventObject
{

public:
    EventObject(const QString& nickname, const QString &eventname);

    QString nickname() const;
    QString eventname() const;

private:
    QString m_nickname;
    QString m_eventname;
};


class EventModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum EventRoles {
        EventNameRole = Qt::UserRole + 1
    };
    EventModel(QObject *parent = 0);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

public slots:
    void addEvent(const QString & nickname, const QString &eventname);

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<EventObject*> m_EventList;
};


#endif // EVENTMODEL_H
