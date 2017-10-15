# Abstract
This simple app has a Text Entry Box and a button that triggers the text to hit the [Azure Sentiment Analysis API](https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-sentiment-analysis) and returns a corresponding Emoji and changes the background color appropriately.

# Get Started with React Native
The Mobile Center SDK uses a modular architecture so you can use any or all of the services.
<br>
<br>
Let's get started with setting up Mobile Center React Native SDK in your app to use Mobile Center Analytics and Mobile Center Crashes

## 1. Prerequisites
Before you begin, please make sure that the following prerequisites are met:
   * You are using a React Native project that runs React Native 0.34 or later.
   * You are targeting devices that are running on Android Version 4.0.3/API level 15 or later, or iOS version 8.0 or later.
   * The default way to use the SDK requires [Cocoapods](https://cocoapods.org/). Nonetheless, it is possible to link the SDK manually.

## 2. Create your app in the Mobile Center Portal to obtain the App Secret
If you have already created your app in the Mobile Center portal, you can skip this step.
  1) Head over to [mobile.azure.com](https://mobile.azure.com).
  2) Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
  3) Enter a name and an optional desciption for your app.
  4) Select the appropriate OS (Android or iOS) and select **React Native** as the platform.
  5) Hit the button at the bottom right that says **Add new app**.
Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the Mobile Center Portal.

## 3. Add the Mobile Center SDK modules
The default integration of the SDK uses Cocoapods for iOS. If you are not using Cocoapods in your app, you need to integrate the React Native SDK manually for your iOS app.

### 3.1 Add Mobile Center SDK modules
Open a Terminal and navigate to the root of your React Native project, then enter the following line to add Mobile Center Analytics and Crashes to the app:
```js
npm install mobile-center mobile-center-analytics mobile-center-crashes --save
```
  1) The Mobile Center SDK uses a modular approach, where you just add the modules for Mobile Center services that you want to use. mobile-center-analytics and mobile-center-crashes make sense to add to almost every app, as they provide value with no additional setup required. mobile-center provides general purpose [Mobile Center APIs](https://docs.microsoft.com/en-us/mobile-center/sdk/other-apis/react-native), useful for multiple services.
  2) Link the plugins to the React Native app by using the react-native link command.
  ```js
  react-native link
  ```
  On **React Native 0.47.0**, there is a bug when using link without parameters
```js
react-native link mobile-center
react-native link mobile-center-analytics
react-native link mobile-center-crashes
```
For iOS, it will try to download the iOS Mobile Center SDK from Cocoapods, if you see an error like:
```js
Added code to initialize iOS Mobile Center SDK in ios/reactnativesample/AppDelegate.m
Analyzing dependencies [!] Unable to find a specification for RNMobileCenterShared (~> {version})
```
Please run the following command:
```js
pod repo update
```
  3) And then retry running ```react-native link```.
A set of prompts will appear asking for additional information. The first will ask for the App Secret, which enables Mobile Center to map this app to the right user account.
```js
What is the Android App Secret? 0000-0000-0000-0000-000000000000

What is the iOS App Secret? 0000-0000-0000-0000-000000000000
```
If you provided the App Secret previously, you won't be prompted again instead seeing the current value for the secret and where to change it in the source if needed.
<br>
<br>
The SDK will then ask whether or not to send user events automatically. [Learn more about sending user events manually](https://docs.microsoft.com/en-us/mobile-center/sdk/analytics/react-native#wait-for-js-to-enable-mobile-center-analytics).
```js
For the Android app, should user tracking be enabled automatically? (Use arrow keys)
    ❯ Enable Automatically
      Enable in JavaScript

For the iOS app, should user tracking be enabled automatically? (Use arrow keys)
    ❯ Enable Automatically
      Enable in JavaScript
```
Finally it will ask whether or not to send crash reports automatically. [Learn more about processing on crash reports in JS].
```
For the Android app, should crashes be sent automatically or processed in JavaScript before being sent? (Use arrow keys)
    ❯ Automatically
      Processed in JavaScript by user

For the iOS app, should crashes be sent automatically or processed in JavaScript before being sent? (Use arrow keys)
    ❯ Automatically
      Processed in JavaScript by user
 ```
 
 ### 3.2 [iOS only] Integrate the iOS SDK manually
 We **strongly** recommend integrating the SDK via Cocoapods as described above. Nonetheless, it's also possible to integrate the iOS native SDK manually.
 
  1) Download the [Mobile Center SDK for React Native frameworks](https://github.com/Microsoft/mobile-center-sdk-react-native/releases/tag/0.10.0) provided as a zip file.
  2) From the release notes on Github, please also download the corresponding frameworks of the Mobile Center SDK for iOS.
  3) Unzip both archives and you will see a folder called ```MobileCenter-SDK-Apple/iOS``` that contains different frameworks for each Mobile Center service. The framework called ```MobileCenter``` is required in the project as it contains code that is shared between the different modules. You will also see a folder named ```RNMobileCenterShared``` which contains a single framework for the React Native bridge for iOS which is also required.
  4) [Optional] Create a subdirectory for 3rd-party libraries.
As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a Vendor subdirectory now (under the ios directory of your project).
Create a group called Vendor inside your Xcode project to mimic your file structure on disk.
  5) Open Finder and copy the previously unzipped ```MobileCenter-SDK-Apple/iOS``` and ```RNMobileCenterShared``` folders into your project's folder at the location where you want it to reside.
  6) Add the SDK frameworks to the project in Xcode:
Make sure the Project Navigator is visible (⌘+1).
Now drag and drop ```MobileCenter.framework```, ```MobileCenterAnalytics.framework```, ```MobileCenterCrashes.framework``` and ```RNMobileCenterShared.framework``` from the Finder (in the location from the previous step) into Xcode's Project Navigator. Note that ```MobileCenter.framework``` and ```RNMobileCenterShared.framework``` are required to start the SDK, make sure they are added to your project, otherwise the other modules won't work and your app won't compile.
A dialog will appear, make sure your app target is checked. Then click **Finish**.

## 4. Start the SDK
Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. There is no additional setup required. Look at [Analytics](https://github.com/jCho23/MobileAzureDevDays/tree/master/ReactNative#mobile-center-analytics) and [Crashes](https://github.com/jCho23/MobileAzureDevDays/tree/master/ReactNative#mobile-center-crashes) section for APIs guides and walkthroughs to learn what Mobile Center can do.

# Mobile Center Analytics
Mobile Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the Mobile Center portal for you to analyze the data.

Please follow the [Get started section](https://github.com/jCho23/MobileAzureDevDays/tree/master/ReactNative#get-started-with-react-native) if you haven't set up the SDK in your application yet.

## Session and device information
Once you add Mobile Center Analytics to your app and the SDK is started, it will automatically track sessions and device properties like OS Version, model, etc. You don’t need to write any additional code.

## Custom events
You can track your own custom events with **up to five properties** to know what's happening in your app, understand user actions, and see the aggregates in the Mobile Center portal.
<br>
<br>
Once you have started the SDK, use the ```trackEvent``` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 64 characters per event property name and event property value.
```js
// import Mobile Center Analytics at the top of the file.
import Analytics from "mobile-center-analytics";

Analytics.trackEvent("Video clicked", { Category: "Music", FileName: "favorite.avi" });
```
This function returns a promise, in which the success case returns an empty string, and the error case returns the error.
<br>
<br>
Properties for events are entirely optional. If you just want to track an event, use this sample instead:
```js
Analytics.trackEvent("Video clicked");
```
## Enable or disable Mobile Center Analytics at runtime
You can enable and disable Mobile Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.
```js
await Analytics.setEnabled(false);
```
This function returns a promise, in which the success case returns an empty string, and the error case returns the error.
<br>
<br>
To enable Mobile Center Analytics again, use the same API but pass ```true``` as a parameter

## Check if Mobile Center Analytics is enabled
You can also check if Mobile Center Analytics is enabled or not.
```js
const enabled = await Analytics.isEnabled();
```
This function returns a promise, in which the success case returns a boolean, and the error case returns the error.

## Wait for JS to enable Mobile Center Analytics
In some cases, an application may want to ask users whether they want to share analytics information. In that case, during installation, you should select ```Enable in JavaScript``` during ```react-native link```.

```js
For the [platform] app, should user tracking be enabled automatically ? (Use arrow keys)
          Enable Automatically
        > Enable in JavaScript
        ```
This means that for any information to be sent to Mobile Center (even basic session information), the developer must first enable Mobile Center Analytics inside the app by adding the following line to their code.
```js
await Analytics.setEnabled(true);
```

# Mobile Center Crashes
Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to Google Play. Crash logs contain valuable information for you to help fix the crash.
<br>
<br>
Please follow the [Get started section](https://github.com/jCho23/MobileAzureDevDays/tree/master/ReactNative#get-started-with-react-native) if you haven't set up the SDK in your application yet.
<br>
<br>
Wherever you are using Mobile Center Crashes, add the following import at the top of the file.
```js
// Import Mobile Center Crashes at the top of the file.
import Crashes from "mobile-center-crashes";
```

## Generate a test crash
Mobile Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.
```js
Crashes.generateTestCrash();
```
It's also easy to generate a JavaScript crash. Add the following line to your code, which throws a JavaScript error and causes a crash.
```js
throw new Error("This is a test javascript crash!");
```
**Your React Native app needs to be compiled in release mode for this crash to be sent to Mobile Center.**

## Get more information about a previous crash
Mobile Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?
At any time after starting the SDK, you can check if the app crashed in the previous launch:
```js
const didCrash = await Crashes.hasCrashedInLastSession();
```
This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occured.

#### Details about the last crash
If your app crashed previously, you can get details about the last crash.
```js
const crashReport = await Crashes.lastSessionCrashReport();
```

## Customize your usage of Mobile Center Crashes
Mobile Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to Mobile Center.

### Processing crashes in JavaScript
During ```react-native link```, the SDK will ask whether or not to send crash reports automatically or process crashes in JavaScript. Opting to process crashes first means more work for the developer, but greater control over user privacy and allows you to attach a message with a crash report.
<br>
<br>
Processing a crash in JavaScript requires you to use the ```process``` method from Mobile Center Crashes.
```js
// import the Crashes library at the top of the file
import Crashes from "mobile-center-crashes";
```
Then, you can send all crashes that have been queued up since the last call to ```process``` or discard them.
<br>
<br>
The following example shows how to handle a user confirmation dialog:
```js
Crashes.process((reports, send) => {
      if (reports.length > 0) {
        Alert.alert(
          `Send ${reports.length} crash(es)?`,
          '',
          [
            { text: 'Send', onPress: () => send(true) },
            { text: 'Ignore', onPress: () => send(false), style: 'cancel' },
          ],
          { cancelable: false }
        );
      }
    });
```
### Get information about the sending status for a crash log
At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. Mobile Center Crashes has three different callbacks that you can use in your app to be notified of what is going on.
<br>
<br>
To do that you have to define an event listener in your code as in the following example:
```js
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
 ```
 All callbacks are optional. You don't have to provide all 3 methods in the event listener object, for example you can implement only ```willSendCrash```.
 <br>
 <br>
 To use that feature you need to have answered **Processed in JavaScript by user** when executing ```react-native link``` for the Crash service configuration. This feature is thus dependent on [Processing crashes in JavaScript](https://github.com/jCho23/MobileAzureDevDays/tree/master/ReactNative#processing-crashes-in-javascript).
 
 If you configure crashes to be sent automatically, you will likely register the listener too late and thus the crashes would already be sent before Javascript loads your custom code.
 <br>
 <br>
Thus you should configure crashes to be processed in Javascript and set up the event listener before calling ```Crashes.process```.
 
 ### Add attachments to a crash report
 You can add one binary and one text attachment to a crash report. The SDK will send it along with the crash so that you can see it in Mobile Center portal.
 ```js
 Crashes.process(function (reports, send) {
      for (const report of reports) {
        report.addTextAttachment("Hello text attachment!", "hello.txt");
        report.addBinaryAttachment(`${imageAsBase64string}`, "logo.png", "image/png");
      }
      send(true);
    });
    ```
## Enable or disable Mobile Center Crashes at runtime
You can enable and disable Mobile Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.
```js
await Crashes.setEnabled(false);
```
To enable Mobile Center Crashes again, use the same API but pass ```true``` as a parameter.
```js
await Crashes.setEnabled(true);
```

## Check if Mobile Center Crashes is enabled
You can also check if Mobile Center Crashes is enabled or not:
```js
const enabled = await Crashes.isEnabled();
```

# Push Notifications
In order to set up Push Notifications, you will have to set up the Push Mobile Center SDK, as well as the platform specific push services (Firebase Cloud Messaging (FCM), Apple Notifications Service (APNs), Windows Notifications Services (WNS). These instructions can be found in the Mobile Center Push portal, as well as in the Mobile Center SDK docs. You can follow the instructions provided in the Mobile Center portal, along with our detailed instructions found in the following links:

## React Native Android Push
Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal. Mobile Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](https://firebase.google.com/docs/cloud-messaging/).
<br>
<br>
Note that only devices having the [Google Play](https://play.google.com/store) store application or emulators with **Google APIs** images can receive the notifications.

**Firebase displays a notification in the system notification center only if the application is in background at the moment the Push is received.**

## Prerequisite - Add Firebase to your app
Before using Mobile Center Push service, you need to add Firebase to your application. You can either choose a manual integration or Firebase Assistant.

### 1. Prerequisites
Please learn about [Prerequisites](https://firebase.google.com/docs/android/setup#prerequisites), in particular please make sure to keep Google Repository up-to-date in the [Android SDK Manager](https://developer.android.com/studio/intro/update.html#sdk-manager).

### 2. Manual integration
  1) Follow the instructions listed in [Manually add Firebase](https://firebase.google.com/docs/android/setup#manually_add_firebase) section.
  2) Make sure to continue following instructions in **Add the SDK** sub section right after but do not add ```compile "com.google.firebase:firebase-core:${version}"``` as the SDK manages this step for you can it could trigger incompatibilities if versions mismatch.
  

























