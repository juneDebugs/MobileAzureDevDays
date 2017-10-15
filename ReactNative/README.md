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



# Mobile Center Build
Mobile Center helps you build the mobile apps you and your team is working on, using a secure infrastructure. You can forget about configuring build servers locally, complicated configurations and code that is working on a co-worker's machine, but not working on yours. To get started, a member of the app in Mobile Center needs to connect to their source control and select the repository where the app is located and then start building your app with only a few clicks.
<br>
<br>
Currently, you can build apps hosted on Git repositories in GitHub, Bitbucket and Visual Studio Team Services (VSTS).

## React Native iOS Build 
Mobile Center can build React Native apps written in **React Native version 0.34 or newer**.
<br>
<br>
To start building a React Native iOS app, you will firstly need to connect to your repository service (GitHub, Bitbucket, VSTS) account, select a repository and a branch where your app lives and then you can set up your first build. Choose the project's ```package.json``` that you want to build; for the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

### 1. Linking your repository
If you haven't previously connected to your repository service (GitHub, Bitbucket, VSTS) account, you will firstly need to do that. Once your account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull rights for it.

### 2. Selecting a branch
Next step once you have selected a repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

### 3. Setting up your first build
To kick off the first build, configure how the iOS project should get built.

#### 3.1. Project

Select your project’s ```package.json```. Mobile Center will automatically detect the associated Xcode project/workspace.

#### 3.2. Xcode version

Select the Xcode version to run the build on.

#### 3.3. Build triggers

By default a new build is triggered on every push a developer does to the configured branch. This is often referred as "Continuous Integration". If you prefer to manually trigger a new build, you can change this setting in the configuration pane.
#### 3.4. Increment build number

When enabled, the ```CFBundleVersion``` in the Info.plist of your app automatically increments for each build. The change happens pre build and won't be committed to your repository.

#### 3.5. Code signing

A successful build will produce an ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload a [provisioning profile (.mobileprovision) and a valid certificate (.p12)](https://docs.microsoft.com/en-us/mobile-center/build/ios/code-signing/uploading-files), along with the password for the certificate. The settings in your Xcode project need to be compatible with the files you are uploading. You can read more about [code signing here](https://docs.microsoft.com/en-us/mobile-center/build/ios/code-signing/index) and in the [Apple Developer official documentation](https://developer.apple.com/support/code-signing/).

#### 3.6. Launch your successful build on a real device

Use your newly produced IPA file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. [Read more about it here](https://docs.microsoft.com/en-us/mobile-center/build/build-test-integration).

#### 3.7. CocoaPods

Mobile Center scans the selected branch and if it finds a Podfile, it will automatically do a ```pod install``` step at the beginning of every build. This will ensure that all dependencies are installed.

#### 3.8. Distribution to a distribution group

You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.
Once you save the configuration, a new build will be automatically kicked off.

### 4. Build results
After a build has been triggered, it can be in the following states:
* **queued** - the build is in a queue waiting for resources to be freed up
* **building** - the build is running and performing the predefined tasks
* **succeeded** - the build is completed and it has succeeded
* **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
* **canceled** - the build has been canceled by a user action or it has timed out

#### 4.1. Build logs
For a completed build (succeeded or failed), download the logs to understand more about how the build went. Mobile Center provides an archive with the following files:
```js
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1> (e.g. 2_Get Sources.txt)
    |-- <build-step-2> (e.g. 3_Pod install.txt)
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
 ```
 The build step specific logs (located in the ```build/``` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

#### 4.2. The app (.ipa)
The .ipa is an iPhone application archive file which stores the iOS app.
* if the build has been correctly signed, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. More details about code signing and distribution with Mobile Center can be [found here](https://docs.microsoft.com/en-us/mobile-center/build/ios/code-signing/index).
* if the build has not been signed, the .ipa can be signed by the developer (e.g. locally using codesign) or used for other purposes (e.g. upload to the Test service for UI testing on real devices or run in the simulator)
* All builds kicked off after May 17th are generated by [xcodebuild](https://docs.microsoft.com/en-us/mobile-center/build/ios/xcodebuild). Unsigned builds will not produce an. ipa file. The artifact of an unsigned build is the .xcarchive file which can be used to generate an .ipa file with the Xcode Archives organizer.

#### 4.3. The source maps and symbol files
Upon building a React Native iOS app, a JavaScript source map and one or multiple .dsym files are automatically generated with each build and can be downloaded once the build is completed.+
* if you have previously integrated the Mobile Center SDK in your app with the crash reporting module enabled, the crash reporting beacon requires this .dsym file and the JavaScript sourcemap for a build in order to display human readable (symbolicated) crash reports
* if you have previously integrated another SDK for crash reporting purposes in your app, the corresponding service requires the .dsym file and the JavaScript sourcemap in order to display human readable (symbolicated) crash reports

Keep in mind that the .dsym file does not change upon code signing the .ipa. If you decide to code sign the build later, the .dsym generated before code signing is still valid.
<br>
<br>
If this app has the crashes SDK integrated, iOS symbols and source maps will automatically be sent to Mobile Center Crashes service to enable human readable (symbolicated) crash reports at both the native and JavaScript stack.

### 5. Build tips
#### 5.1. Yarn

[Yarn](https://yarnpkg.com/en/) is a faster, more deterministic replacement for ```npm```. If a ```yarn.lock``` file is present in your repo next to ```package.json```, then Mobile Center will use Yarn, doing ```yarn install``` at the start of the build. Otherwise, it will do ```npm install```.


#### 5.2. Custom build scripts

In some scenarios you may want to run a script at the start of the build. For instance, if your React Native app uses TypeScript, then you'll want to run the ```tsc``` compiler at build start.
<br>
<br>
Mobile Center will have a [dedicated feature](https://docs.microsoft.com/en-us/mobile-center/general/roadmap#build-service) for running custom scripts as part of a build. But for now you can achieve the same effect by creating a ```postinstall``` script in ```package.json```, adding a command like this:
```js
"scripts": {
    ...
    "postinstall" : "./postinstall.sh"     [other examples: "node ./postinstall.js" or just a single command like "tsc"]
  },
  ```
Postinstall scripts run right after all the ```package.json``` packages are installed, so you use those packages in your script.

## React Native Android Build
Mobile Center can build React Native apps written in React Native version 0.34 or newer.
<br>
<br>
To start building a React Native iOS app, first of all, you need to connect to your repository service (GitHub, Bitbucket, VSTS) account, select a repository and a branch where your app lives and then you can set up your first build. Choose the project's ```package.json``` that you want to build; for the app to run on a real device, the build needs to be code signed with a valid certificate.

### 1. Linking your repository
If you haven't done it previously already, first of all, you have to connect your repository service (GitHub, Bitbucket, VSTS) account. Once your account is connected, select the repository where your Android project is located. In order to setup a build for a repository, you need admin and pull rights for it.

### 2. Selecting a branch
Next step once you have selected a repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

### 3. Setting up your first build
To kick off the first build, configure how the Android project should get built.

#### 3.1. Project

Select your project’s ```package.json```. Mobile Center will automatically extract information from its associated ```build.gradle``` file, including including dependencies, build tools version, build types, and product flavors.

#### 3.2. Build variant

The available build variants will populate from the Build Types and Product Flavors specified in the build.gradle file. Select which build variant should be built.

#### 3.3. Build triggers

By default a new build is triggered on every push a developer does to the configured branch. This is often referred to as “Continuous Integration”. If you prefer to manually trigger a new build, you can change this setting in the configuration pane.

#### 3.4. Increment version number

When enabled, the version code in the AndroidManifest.xml of your app automatically increments for each build. The change happens during the actual build and won't be committed to your repository.

#### 3.5. Launch your successful build on a real device

Use your newly produced APK file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. [Read more about it here](https://docs.microsoft.com/en-us/mobile-center/build/build-test-integration).

#### 3.6. Code signing

A successful build will produce an APK file. In order to release the build to the Play Store, it needs to be signed with a valid certificate stored in a keystore. To sign the builds produced from a branch, enable code signing in the configuration pane, upload your keystore to your repository, and provide the relevant values in the configuration pane. You can read more about [code signing here](https://docs.microsoft.com/en-us/mobile-center/build/android/code-signing/setup).

#### 3.7. Distribution to a distribution group

You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app.
Once you save the configuration, a new build will be kicked off automatically.

### 4. Build results
After a build has been triggered, it can be in the following states:
* **queued** - the build is in a queue waiting for resources to be freed up
* **building** - the build is running and performing the predefined tasks
* **succeeded** - the build is completed and it has succeeded
* **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
* **canceled** - the build has been canceled by a user action or it has timed out

#### 4.1. Build logs

For a completed build (succeeded or failed), download the logs to understand more about how the build went. Mobile Center provides an archive with the following files:
```js
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1>
    |-- <build-step-2>
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
    ```
 The build step specific logs (located in the ```build/``` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.
 
 #### 4.2. The app (.apk)

The APK is an Android application packaged file which stores the Android app. If the build has been correctly signed, the APK can be installed on a real device and deployed to the Play Store. If the build has not been signed, the APK can be run on an emulator or used for other purposes

## 5. Supported versions and requirements
The minimum version supported to build Android apps is 4.0.3 (API level 15). Android apps can have a lower minimum API level required to run, but have to target at least API level 15

## 6. Build tips

















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
  
### Using Firebase Assistant
  1) Follow [these instructions](https://developer.android.com/studio/write/firebase.html) if you don't see ```Firebase``` in the ```Tools``` menu.
  2) Click on Tools > Firebase and follow **only** the first two following steps:
        * Connect your app to Firebase
        * Add FCM to your app
Step 3 is managed by Mobile Center SDK automatically, so you can stop after step 2.
```js

Please remove this if added automatically as the SDK manages this for you can it can trigger build errors if versions mismatch:
```

### 4. Obtain your Android API Key
Go to Project Settings and under Cloud Messaging, copy your Server Key. This will be the Android API Key that you will need to set in the Mobile Center Push portal.

## Add Mobile Center Push to your app
Please follow the [Get started section](https://github.com/jCho23/MobileAzureDevDays/tree/master/ReactNative#get-started-with-react-native) if you haven't set up the SDK in your application yet.
<br>
<br>
The Mobile Center SDK is designed with a **modular approach** – you only need to integrate the services that you're interested in.
  1) Open a Terminal and navigate to the root of your React Native project, then enter the following to add Mobile Center Push to the app:
  ```js
  npm install mobile-center-push --save
  ```
  2) Link the plugin to the React Native app by using the react-native link command.
  ```js
  react-native link mobile-center-push
  ```
  Those steps modify your ```MainApplication.java``` file, adding ```RNPushPackage``` there.
  

## Intercept push notifications

You can set up a listener to be notified whenever a push notification is received in foreground or a background push notification has been clicked by the user. Firebase does not generate notifications when the push is received in foreground.
If the push is received in background, the event is **NOT** triggered at receive time. The event is triggered when you click on the notification.
<br>
<br>
You need to register the listener when your app starts. A convenient place to do that is at the outer level in the .js file for your root component:
```js
import Push from 'mobile-center-push';
import { AppState, Alert } from 'react-native';

class MyApp extends Component {
}

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
```
## Existing Firebase Analytics users
Mobile Center Push has a dependency on Firebase. Firebase Analytics is included in the core Firebase module and therefore, it's a dependency for Firebase messaging. Mobile Center Push SDK automatically disables Firebase Analytics to prevent unwanted data collection by Firebase.
<br>
<br>
If you are a Firebase customer and want to keep reporting analytics data to Firebase, you need to call the following method before ```RNPushPackage``` is instantiated, like from ```MainApplication.onCreate```:
```js
import com.microsoft.azure.mobile.push.Push;

...

Push.enableFirebaseAnalytics(getApplication());
```

## Enable or disable Mobile Center Push at runtime
You can enable and disable Mobile Center Push at runtime. If you disable it, the SDK will stop updating the Google registration identifier used to push but the existing one will continue working. In other words, disabling the Mobile Center Push in the SDK will **NOT** stop your application from receiving push notifications.
```js
import Push from 'mobile-center-push';

...

await Push.setEnabled(false);      // Disable push
await Push.setEnabled(true);       // Re-enable it
```

## Check if Mobile Center Push is enabled
You can also check if Mobile Center Push is enabled or not:
```
import Push from 'mobile-center-push';

...

const pushEnabled = await Push.isEnabled();
```


























