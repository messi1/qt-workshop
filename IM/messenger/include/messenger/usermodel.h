#ifndef USERMODEL_H
#define USERMODEL_H

#include <QAbstractListModel>

class UserObject
{

public:
    UserObject(const QString &nickname);

    QString nickname() const;
    void resetTimout();
    bool isAlive() const;
    void decrementTimeout();

private:
    QString m_nickname; 
    qint8 m_timout;
};

class UserModel : public QAbstractListModel
{
    Q_OBJECT
public:
    enum MessageRoles {
        NicknameRole = Qt::UserRole + 1,
        ColorRole
    };

    UserModel(QObject *parent = 0);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;

public slots:
    void addUser(const QString &nickname);
    void removeUser(const QString &nickname);
    void decrementTimeout();

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<UserObject*> m_UserList;
};


#endif // USERMODEL_H
