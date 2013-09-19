TEMPLATE = app

QT += qmltest
QT -= gui

CONFIG += qmltestcase
CONFIG -= app_bundle

DEFINES += QUICK_TEST_SOURCE_DIR=\\\"$$PWD\\\"

SOURCES += \
    qml-tests.cpp

OTHER_FILES += \
    utils.js \
    tst_button.qml \
    tst_send_message.qml \
    tst_createEvent.qml

