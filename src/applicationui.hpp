#ifndef ApplicationUI_HPP_
#define ApplicationUI_HPP_

#include <QObject>
#include <qt4/QtCore/QObject>
#include <qt4/QtCore/qstring.h>
#include <qt4/QtCore/qobjectdefs.h>
#include <qt4/QtNetwork/qnetworkreply.h>
#include <qt4/QtCore/qlist.h>
#include <bps/bps.h>
#include <qt4/QtCore/QVariant>
#include <cctype>
#include <stdlib.h>


namespace bb
{
    namespace cascades
    {
        class Application;
        class LocaleHandler;
    }
}

class QTranslator;

/*!
 * @brief Application object
 *
 *
 */

class ApplicationUI : public QObject
{
    Q_OBJECT
public:
    ApplicationUI(bb::cascades::Application *app);


    virtual ~ApplicationUI() { bps_shutdown();
exit(0);
    }
    Q_INVOKABLE void saveValues(QString , QVariant);

    Q_INVOKABLE QString dateFormat(QString);
      Q_INVOKABLE void isNetworkAvailOnAppLaunch();
    Q_INVOKABLE QString getValues(QString , QVariant);
private slots:
    void onSystemLanguageChanged();
public slots:
    void networkAvailabilityResponse(QNetworkReply*);
    Q_SIGNALS:
    void networkis();
    void nonetwork();

private:
    QTranslator* m_pTranslator;
    bb::cascades::LocaleHandler* m_pLocaleHandler;
};

#endif /* ApplicationUI_HPP_ */
