#include <QtCore/QObject>

#include <application-qml/application-qml.h>



int main(int argc, char * argv[])
{


    Q_INIT_RESOURCE(application_qml);

    IM::Application application;
    return application.execute(argc, argv);
}

