#include <QtTest/QTest>
#include <QtTest/QSignalSpy>

#include <messenger/controller.h>

#include "controller_test.h"

static QString const expected_nickname = "Name";
static QString const expected_message = "Hello world.";
static QString const expected_titleEvent = "Beer";

void ControllerTest::invoke_send_keepAlive_sends_signal_send_keepAlive()
{
    // arrange
    IM::Controller testee;
    QSignalSpy signal_spy(&testee, SIGNAL(send_keepAlive(QString const &)));

    testee.set_nickname(expected_nickname);

    // act
    testee.invoke_send_keepAlive();

    // assert
    QCOMPARE(signal_spy.count(), 1);

    const auto arguments = signal_spy.takeFirst();
    QCOMPARE(arguments.size(), 1);
    QCOMPARE(arguments.at(0).toString(), expected_nickname);
}

void ControllerTest::invoke_send_message_sends_signal_send_message()
{
    // arrange
    IM::Controller testee;
    QSignalSpy signal_spy(&testee, SIGNAL(send_message(QString const &, QString const &)));

    testee.set_nickname(expected_nickname);

    // act
    testee.invoke_send_message(expected_message);

    // assert
    QCOMPARE(signal_spy.count(), 1);

    const auto arguments = signal_spy.takeFirst();
    QCOMPARE(arguments.size(), 2);
    QCOMPARE(arguments.at(0).toString(), expected_nickname);
    QCOMPARE(arguments.at(1).toString(), expected_message);
}

void ControllerTest::invoke_send_hostEvent_sends_signal_send_hostEvent()
{
    // arrange
    IM::Controller testee;
    QSignalSpy signal_spy(&testee, SIGNAL(send_hostEvent(QString const &, QString const &)));

    testee.set_nickname(expected_nickname);

    // act
    testee.invoke_send_hostEvent(expected_titleEvent);

    // assert
    QCOMPARE(signal_spy.count(), 1);

    const auto arguments = signal_spy.takeFirst();
    QCOMPARE(arguments.size(), 2);
    QCOMPARE(arguments.at(0).toString(), expected_nickname);
    QCOMPARE(arguments.at(1).toString(), expected_titleEvent);
}


void ControllerTest::invoke_send_partecipateInEvent_sends_signal_send_partecipateInEvent()
{
    // arrange
    IM::Controller testee;
    QSignalSpy signal_spy(&testee, SIGNAL(send_participateInEvent(QString const &, QString const &)));

    testee.set_nickname(expected_nickname);

    // act
    testee.invoke_send_participateInEvent(expected_titleEvent);

    // assert
    QCOMPARE(signal_spy.count(), 1);

    const auto arguments = signal_spy.takeFirst();
    QCOMPARE(arguments.size(), 2);
    QCOMPARE(arguments.at(0).toString(), expected_nickname);
    QCOMPARE(arguments.at(1).toString(), expected_titleEvent);
}

void ControllerTest::invoke_send_callOutEvent_sends_signal_send_callOutEvent()
{
    // arrange
    IM::Controller testee;
    QSignalSpy signal_spy(&testee, SIGNAL(send_callOutEvent(QString const &, QString const &)));

    testee.set_nickname(expected_nickname);

    // act
    testee.invoke_send_callOutEvent(expected_titleEvent);

    // assert
    QCOMPARE(signal_spy.count(), 1);

    const auto arguments = signal_spy.takeFirst();
    QCOMPARE(arguments.size(), 2);
    QCOMPARE(arguments.at(0).toString(), expected_nickname);
    QCOMPARE(arguments.at(1).toString(), expected_titleEvent);
}


