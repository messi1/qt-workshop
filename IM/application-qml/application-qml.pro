TEMPLATE = lib

QT -= gui
QT += qml quick

CONFIG += staticlib

INCLUDEPATH += include

SOURCES += \
    source/application-qml.cpp \

HEADERS += \
    include/application-qml/application-qml.h \

OTHER_FILES += \
    qml/main.qml \
    qml/Button.qml \
    qml/SendMessage.qml \
    qml/Common/Button.qml \
    qml/Common/TextBox.qml \
    qml/Common/AppListView.qml \
    qml/Common/ContactModel.qml

RESOURCES += \
    application-qml.qrc

unix: QMAKE_CXXFLAGS_DEBUG += -fprofile-arcs -ftest-coverage

include(../common.pri)
include(../messenger/messenger.pri)

