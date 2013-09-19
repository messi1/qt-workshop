import QtQuick 2.0
import QtTest 1.0

import "utils.js" as Utils

import "../application-qml/qml"

Item {
    width: 100
    height: 100

    CreateEvent {
        id: testee
    }

    TestCase {
        name: "CreateEvent"
        when: windowShown

        SignalSpy {
            id: spy
            target: testee
        }

        function init() {
            spy.clear();
        }

        function test_a_title_can_be_entered_into_the_text_field() {
            var keys = [ Qt.Key_B, Qt.Key_E, Qt.Key_E, Qt.Key_R ];
            var expected_eventTitle = "beer";

            var newEventTitle_input = Utils.get_item(testee, "id_newEventTitle");
            verify(newEventTitle_input);
            newEventTitle_input.text = ""

            var createEventButton = Utils.get_item(testee, "id_createEventButton");
            verify(createEventButton);

            mouseClick(newEventTitle_input, 5, 5);
            for(var i in keys) {
                keyClick(keys[i]);
            }

            compare(newEventTitle_input.text, expected_eventTitle);
        }

        function test_create_of_new_event() {
            var keys = [ Qt.Key_B, Qt.Key_E, Qt.Key_E, Qt.Key_R ];
            var expected_eventTitle = "beer";

            var newEventTitle_input = Utils.get_item(testee, "id_newEventTitle");
            verify(newEventTitle_input);
            newEventTitle_input.text = ""

            var createEventButton = Utils.get_item(testee, "id_createEventButton");
            verify(createEventButton);

            mouseClick(newEventTitle_input, 5, 5);
            for(var i in keys) {
                keyClick(keys[i]);
            }

            compare(newEventTitle_input.text, expected_eventTitle);

            mouseClick(createEventButton, 5, 5);

            compare(newEventTitle_input.text, "");
        }

        function test_the_title_is_empty_after_it_has_been_created() {
            var keys = [ Qt.Key_B, Qt.Key_E, Qt.Key_E, Qt.Key_R ];
            var expected_eventTitle = "beer";

            var newEventTitle_input = Utils.get_item(testee, "id_newEventTitle");
            verify(newEventTitle_input);
            newEventTitle_input.text = ""

            var createEventButton = Utils.get_item(testee, "id_createEventButton");
            verify(createEventButton);

            mouseClick(newEventTitle_input, 5, 5);
            for(var i in keys) {
                keyClick(keys[i]);
            }

            compare(newEventTitle_input.text, expected_eventTitle);

            mouseClick(createEventButton, 5, 5);

            compare(newEventTitle_input.text, "");
        }
    }

}
