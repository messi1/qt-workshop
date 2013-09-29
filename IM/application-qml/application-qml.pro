TEMPLATE = lib

QT -= gui
QT += qml quick

CONFIG += staticlib

INCLUDEPATH += include

SOURCES += \
    source/application-qml.cpp

HEADERS += \
    include/application-qml/application-qml.h

OTHER_FILES += \
    qml/main.qml \
    qml/Button.qml \
    qml/SendMessage.qml \
    qml/EventList.qml \
    qml/Event.qml \
    qml/EventView.qml \
    qml/CreateEvent.qml \
    qml/TextBox.qml \
    qml/AppListView.qml \
    qml/SettingsView.qml \
    qml/MyListView.qml \
    qml/SlideWindow.qml \
    qml/Delegate.qml \
    qml/ScrollBar.qml \
    qml/SettingsAndLogo.qml \
    qml/SlideSwitch.qml \
    qml/Tab.qml \
    qml/TabPanel.qml \
    qml/MenuBar.qml \
    qml/TitleBar.qml \
    qml/MessageList.qml \
    qml/SendMessagePage.qml \
    qml/SettingsPage.qml

RESOURCES += \
    application-qml.qrc

unix: QMAKE_CXXFLAGS_DEBUG += -fprofile-arcs -ftest-coverage

include(../common.pri)
include(../messenger/messenger.pri)

