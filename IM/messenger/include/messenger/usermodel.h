#ifndef USERMODEL_H
#define USERMODEL_H

#include <QAbstractListModel>

class UserObject
{

public:
    UserObject(const QString &nickname, QObject *parent=0);

    QString nickname() const;

private:
    QString m_nickname;
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

protected:
    QHash<int, QByteArray> roleNames() const;

private:
    QList<UserObject*> m_UserList;
};


#endif // USERMODEL_H
