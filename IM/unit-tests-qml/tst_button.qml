import QtQuick 2.0
import QtTest 1.0

import "utils.js" as Utils

import "../application-qml/qml"

Item {
    width: 100
    height: 100

    Button {
        id: testee

        width: 20
        height: 20
    }

    TestCase {
        name: "Button"
        when: windowShown

        SignalSpy {
            id: spy
            target: testee
        }

        function init() {
            spy.clear();
        }

        function test_the_button_has_a_property_button_text() {
            var expected_text = ""
            testee.btnText = expected_text;
            compare(testee.btnText, expected_text);
        }

        function test_clicking_the_button_sends_signal_buttonClicked() {
            spy.signalName = "clicked";
            verify(spy.valid);

            mouseClick(testee, 5, 5);

            compare(spy.count, 1);
        }

    }

}
