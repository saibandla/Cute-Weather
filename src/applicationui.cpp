#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>
#include <qt4/QtNetwork/qnetworkreply.h>
#include <bb/system/SystemToast>
#include <qt4/QtNetwork/QNetworkAccessManager>
#include <qt4/QtNetwork/QNetworkConfigurationManager>
#include <qt4/QtNetwork/QNetworkConfiguration>

#include "string.h"
#include "string"

using namespace bb::cascades;
using namespace bb::system;

ApplicationUI::ApplicationUI(bb::cascades::Application *app) :
        QObject(app)
{
    // prepare the localization

    m_pTranslator = new QTranslator(this);
    m_pLocaleHandler = new LocaleHandler(this);

    if(!QObject::connect(m_pLocaleHandler, SIGNAL(systemLanguageChanged()), this, SLOT(onSystemLanguageChanged()))) {

    }
    // initial load

    onSystemLanguageChanged();
    if(getValues("location", "").isEmpty())
          	saveValues("location","");
    if(getValues("inches", "").isEmpty())
              	saveValues("inches","false");
    if(getValues("faurenheat", "").isEmpty())
              	saveValues("faurenheat","false");
    if(getValues("mph", "").isEmpty())
                 	saveValues("mph","false");
    // Create scene document from main.qml asset, the parent is set
    // to ensure the document gets destroyed properly at shut down.

    QTime tim=QTime::currentTime();

   int time=tim.hour();


QmlDocument *qml;
if(time>7&&time<20)
{
	saveValues("time","mrng");
    qml = QmlDocument::create("asset:///main.qml").parent(this).property("app",this);
}
else
{
	saveValues("time","night");
	 qml = QmlDocument::create("asset:///mainnight.qml").parent(this).property("app",this);
}

    // Create root object for the UI
    AbstractPane *root = qml->createRootObject<AbstractPane>();
    // Set created root object as the application scene
    app->setScene(root);
}
void ApplicationUI::isNetworkAvailOnAppLaunch() {
	QNetworkAccessManager *manager = new QNetworkAccessManager();
	qDebug()<<"Checking ent";
	QNetworkRequest req;
	QString url = "http://www.google.com/";
	req.setUrl(url);
//	manager->networkAccessible();
	qDebug()<<"mannger net"<<manager->networkAccessible();
//	if(manager->networkAccessible()==QNetworkAccessManager::NotAccessible||manager->networkAccessible()==QNetworkAccessManager::UnknownAccessibility)
//	{
//		emit nonetwork();
//	}
//	else
//	{
	req.setHeader(QNetworkRequest::ContentTypeHeader, "text/xml"); //"gzip"
	req.setAttribute(QNetworkRequest::CacheLoadControlAttribute, QNetworkRequest::AlwaysNetwork);

	connect(manager, SIGNAL(finished(QNetworkReply *)), this, SLOT(networkAvailabilityResponse(QNetworkReply *)));

	manager->get(req);
//	}
}
void ApplicationUI::networkAvailabilityResponse(QNetworkReply *data)
{
	if(data->error() == QNetworkReply::NoError)
	{
		saveValues("navailable","true");
		emit networkis();
		qDebug()<<"Network available";
	}
	else
	{
		emit nonetwork();
		saveValues("navailable","false");
		qDebug()<<"Network unavailable";
//		SystemDialog *dialog = new SystemDialog("OK");
//		dialog->setTitle("Alert");
//		dialog->setBody("Please check your Internet settings.");
	}
}
void ApplicationUI::saveValues(QString key, QVariant value)
{
	QSettings settings;
	settings.setValue(key, value);
}
QString ApplicationUI::dateFormat(QString timestam)
{
	 QString timestamp=timestam;
	 QDateTime send_date=QDateTime::fromTime_t(timestamp.toInt());
	qDebug()<<"date="<<send_date.toString("dd.m  ddd");
return send_date.toString("dd.MM  ddd");
}
QString ApplicationUI::getValues(QString key, QVariant defaultValue)
{
	QSettings settings;
	if (settings.value(key).isNull()) {
			return defaultValue.toString();
	}
	return settings.value(key, defaultValue).toString();
}

void ApplicationUI::onSystemLanguageChanged()
{
    QCoreApplication::instance()->removeTranslator(m_pTranslator);
    // Initiate, load and install the application translation files.
    QString locale_string = QLocale().name();
    QString file_name = QString("CuteWeather_%1").arg(locale_string);
    if (m_pTranslator->load(file_name, "app/native/qm")) {
        QCoreApplication::instance()->installTranslator(m_pTranslator);
    }
}
