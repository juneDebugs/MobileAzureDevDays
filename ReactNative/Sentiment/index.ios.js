import { AppState, Alert, AppRegistry } from 'react-native';

import App from './App';
import config from './config';

import Analytics from "mobile-center-analytics";
import Crashes from "mobile-center-crashes";
import Push from 'mobile-center-push';

async function initMobileCentre() {
    const didCrash = await Crashes.hasCrashedInLastSession();
    if (didCrash) {
        Crashes.process((reports, send) => {
            if (reports.length > 0) {
              Alert.alert(
                'Send ${reports.length} crash(es)?',
                '',
                [
                  { text: 'Send', onPress: () => send(true) },
                  { text: 'Ignore', onPress: () => send(false), style: 'cancel' },
                ],
                { cancelable: false }
              );
            }
          });
    }

    const crashReport = await Crashes.lastSessionCrashReport();
    if (crashReport) {
        // do something wth crash report
    }

    const analyticsEnabled = await Analytics.isEnabled();
    const crashesEnabled = await Crashes.isEnabled();
    const pushEnabled = await Push.isEnabled();
    
    if (!analyticsEnabled) {
        await Analytics.setEnabled(true);
    }

    if (!crashesEnabled) {
        await Crashes.setEnabled(true);
    }

    if (pushEnabled) {
        await Push.setEnabled(true);
    }

    Crashes.setEventListener({
      willSendCrash: function (report) {
          // called after Crashes.process and before sending the crash.
      },
      didSendCrash: function (report) {
          // called when crash report sent successfully.
      },
      failedSendingCrash: function (report) {
          // called when crash report could not be sent.
      }
    });
  
  Push.setEventListener({
      pushNotificationReceived: function (pushNotification) {
        let message = pushNotification.message;
        let title = pushNotification.title;
    
        if (message === null || message === undefined) {
          // Android messages received in the background don't include a message. On Android, that fact can be used to
          // check if the message was received in the background or foreground. For iOS the message is always present.
          title = "Android background";
          message = "<empty>";
        }
    
        // Custom name/value pairs set in the Mobile Center web portal are in customProperties
        if (pushNotification.customProperties && Object.keys(pushNotification.customProperties).length > 0) {
          message += '\nCustom properties:\n' + JSON.stringify(pushNotification.customProperties);
        }
    
        if (AppState.currentState === 'active') {
          Alert.alert(title, message);
        }
        else {
          // Sometimes the push callback is received shortly before the app is fully active in the foreground.
          // In this case you'll want to save off the notification info and wait until the app is fully shown
          // in the foreground before displaying any UI. You could use AppState.addEventListener to be notified
          // when the app is fully in the foreground.
        }
      }
    });
  }

AppRegistry.registerComponent('Sentiment', () => App);

initMobileCentre();