TEMPLATE = subdirs

# sub projects for the C++ gui skeleton
CPP_GUI = \
    main-cpp \
    application-cpp \
    unit-tests-cpp \

# sub projects for the UI forms skeleton
UIC_GUI = \
    main-uic \
    application-uic \
    unit-tests-uic \

# sub projects for the Qml skeleton
QML_GUI = \
    main-qml \
    application-qml \
    unit-tests-qml \


SUBDIRS = \
#    $${CPP_GUI} \
#    $${UIC_GUI} \
    $${QML_GUI} \
    messenger \
    unit-tests

# dependencies for the C++ gui skeleton
main-cpp.depends = messenger application-cpp
unit-tests-cpp.depends = application-cpp

# dependencies for the UI forms skeleton
main-uic.depends = messenger application-uic
unit-tests-uic.depends = application-uic

# dependencies for the Qml skeleton
main-qml.depends = messenger application-qml


unit-tests.depends = messenger


OTHER_FILES += \
    ../README.md

