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
    qml/EventList.qml \
    qml/Event.qml \
    qml/EventView.qml \
    qml/CreateEvent.qml \
    qml/TextBox.qml \
    qml/MyListView.qml \
    qml/SlideWindow.qml \
    qml/Delegate.qml \
    qml/ScrollBar.qml \
    qml/SettingsAndLogo.qml \
    qml/TabPanel.qml \
    qml/MenuBar.qml \
    qml/TitleBar.qml \
    qml/MessageList.qml \
    qml/SendMessagePage.qml \
    qml/SettingsPage.qml \
    qml/EventDelegate.qml \
    qml/TextButton.qml \
    qml/SmallText.qml \
    qml/UserPage.qml \
    qml/UserView.qml \
    qml/SendEventPage.qml \
    qml/components/TextButton.qml \
    qml/components/TextBox.qml \
    qml/components/TabPanel.qml \
    qml/components/Tab.qml \
    qml/components/ScrollBar.qml \
    qml/components/Button.qml

RESOURCES += \
    application-qml.qrc

unix: QMAKE_CXXFLAGS_DEBUG += -fprofile-arcs -ftest-coverage

include(../common.pri)
include(../messenger/messenger.pri)

