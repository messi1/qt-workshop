import QtQuick 2.0

import QtQuick 2.0
import QtTest 1.0

import "utils.js" as Utils

import "../application-qml/qml"

Item {
    width: 320
    height: 32


    SendMessage {
        id: testee
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

        function test_a_message_can_be_entered_into_the_text_field() {
            var keys = [ Qt.Key_H, Qt.Key_E, Qt.Key_L, Qt.Key_L, Qt.Key_O ];
            var expected_message = "hello";

            var message_input = Utils.get_item(testee, "id_message_input");
            verify(message_input);
            mouseClick(message_input, 5, 5);

            for(var i in keys) {
                keyClick(keys[i]);
            }

            compare(message_input.text, expected_message);
        }

        function test_clicking_the_send_button_sends_signal_submit_with_the_entered_message() {
            var expected_message = "hello world";

            var message_input = Utils.get_item(testee, "id_message_input");
            verify(message_input);
            message_input.text = expected_message;

            var send_button = Utils.get_item(testee, "id_send_button");
            verify(send_button);

            spy.signalName = "submit";

            mouseClick(send_button, 5, 5);

            compare(spy.count, 1);
            compare(spy.signalArguments[0][0], expected_message);
        }

        function test_clicking_the_send_button_deletes_the_message_after_sending_the_signal() {
            var message_input = Utils.get_item(testee, "id_message_input");
            verify(message_input);
            message_input.text = "Message";

            var send_button = Utils.get_item(testee, "id_send_button");
            verify(send_button);

            mouseClick(send_button, 5, 5);

            compare(message_input.text, "");
        }

        function test_no_signal_is_sent_if_the_message_is_empty() {
            var message_input = Utils.get_item(testee, "id_message_input");
            verify(message_input);
            message_input.text = "";

            var send_button = Utils.get_item(testee, "id_send_button");
            verify(send_button);

            spy.signalName = "submit";

            mouseClick(send_button, 5, 5);

            compare(spy.count, 0);
        }
    }
}
