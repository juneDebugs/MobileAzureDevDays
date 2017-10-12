# Abstract
This simple app has a Text Entry Box and a button that triggers the text to hit the [Azure Sentiment Analysis API](https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-sentiment-analysis) and returns a corresponding Emoji and changes the background color appropriately.

# Get Started with Android
The Mobile Center SDK uses a modular architecture so you can use any or all of the services.
Let's get started with setting up Mobile Center Android SDK in your app to use Mobile Center Analytics and Mobile Center Crashes. To add Mobile Center Distribute to you app, please have a look at the documentation for [Mobile Center Distribute](https://docs.microsoft.com/en-us/mobile-center/sdk/distribute/android).

## 1. Prerequisites
Before you begin, please make sure that the following prerequisites are met:
  * Your Android project is set up in Android Studio.
  * You are targeting devices running Android Version 4.0.3 (API level 15) or later.

## 2. Create your app in the Mobile Center Portal to obtain the App Secret
If you have already created your app in the Mobile Center portal, you can skip this step.
 1) Head over to [mobile.azure.com](https://mobile.azure.com).
 2) Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
 3) Enter a name and an optional desciption for your app.
 4) Select **Android** as the OS and **Java** as a platform.
 5) Hit the button at the bottom right that says **Add new app**.
 6) Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the Mobile Center Portal.
 
## 3. Add the Mobile Center SDK modules
 1) Open your app level ```build.gradle``` file (```app/build.gradle```) and add the following lines after ```apply plugin```. Include the dependencies that you want in your project. Each SDK module needs to be added as a separate dependency in this section. If you would want to use Mobile Center Analytics and Crashes, add the following lines:
 ```
 dependencies {
    def mobileCenterSdkVersion = '0.12.0'
    compile "com.microsoft.azure.mobile:mobile-center-analytics:${mobileCenterSdkVersion}"
    compile "com.microsoft.azure.mobile:mobile-center-crashes:${mobileCenterSdkVersion}"
}
```
 2) Make sure to trigger a Gradle sync in Android Studio.
 
 Now that you've integrated the SDK in your application, it's time to start the SDK and make use of Mobile Center.

## 4. Start the SDK
### 4.1 Add the start() method

In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK. Insert the following line inside your app's main activity class' ```onCreate```-callback to use **Mobile Center Analytics** and **Mobile Center Crashes**:
```
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class, Crashes.class);
```
### 4.2 Replace the placeholder with your App Secret

Make sure to replace ```{Your App Secret}``` text with the actual value for your application. The App Secret can be found on the **Getting Started** page on the Mobile Center portal or through the **Manage App** button.
<br>
<br>
The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.
<br>
<br>
The example above shows how to use the ```start()``` method and include both Mobile Center Analytics and Mobile Center Crashes.
<br>
<br>
If you do not want to use one of the two services, remove the corresponding parameter from the method call above.
<br>
<br>
Note that, unless you explicitly specify each module as parameters in the start method, you can't use that Mobile Center service. In addition, the ```start()``` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.
<br>
<br>
For example - If you just want to onboard to Mobile Center Analytics, you should modify the ```start()``` API call as follows:
```
MobileCenter.start(getApplication(), "{Your App Secret}", Analytics.class);
```
Android Studio will automatically suggest the required import statements once you insert the ```start()``` method, but if you see an error that the class names are not recognized, add the following lines to the import statements in your activity class:
```
import com.microsoft.azure.mobile.MobileCenter;
import com.microsoft.azure.mobile.analytics.Analytics;
import com.microsoft.azure.mobile.crashes.Crashes;
```
Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.
<br>
<br>
Look at the documentation for [Mobile Center Analytics](https://docs.microsoft.com/en-us/mobile-center/sdk/analytics/android) and [Mobile Center Crashes](https://docs.microsoft.com/en-us/mobile-center/sdk/crashes/android) to learn how to customize and use more advanced functionalities of both services.
<br>
<br>
To learn how to get started with in-app updates, read the documentation of [Mobile Center Distribute].
<br>
<br>
To learn how to get started with Push, read the documentation of [Mobile Center Push].

# Mobile Center Analytics
Mobile Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the Mobile Center portal for you to analyze the data.
<br>
<br>
Please follow the [Getting Started](https://github.com/jCho23/MobileAzureDevDays/tree/master/Java#1-prerequisites) section if you haven't set up the SDK in your application yet.

## Session and Device information
Once you add Mobile Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without writing any additional code.

## Custom Events
You can track your own custom events with **up to five properties** to know what's happening in your app, understand user actions, and see the aggregates in the Mobile Center portal.
<br>
<br>
Once you have started the SDK, use the ```trackEvent()``` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 64 characters per event property name and event property value.
```
Map<String, String> properties = new HashMap<>();
properties.put("Category", "Music");
properties.put("FileName", "favorite.avi");

Analytics.trackEvent("Video clicked", properties);
```
Properties for events are entirely optional – if you just want to track an event, use this sample instead:
```
Analytics.trackEvent("Video clicked");
```

## Enable or disable Mobile Center Analytics at runtime
You can enable and disable Mobile Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.
```
Analytics.setEnabled(false);
```
To enable Mobile Center Analytics again, use the same API but pass ```true``` as a parameter.
```
Analytics.setEnabled(true);
```
This API is asynchronous, you can read more about that in our [Mobile Center Asynchronous APIs guide](https://docs.microsoft.com/en-us/mobile-center/sdk/android-async).

## Check if Mobile Center Analytics is enabled
You can also check if Mobile Center Analytics is enabled or not.
```
Analytics.isEnabled();
```

# Mobile Center Crashes
Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to Google Play. Crash logs contain valuable information for you to help fix the crash.
<br>
<br>
Please follow the [Getting Started](https://github.com/jCho23/MobileAzureDevDays/tree/master/Java#1-prerequisites) section if you haven't set up the SDK in your application yet.

## Generate a test crash
Mobile Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in debug builds and won't do anything in release builds.
```
Crashes.generateTestCrash();
```
## Get more information about a previous crash
Mobile Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?
At any time after starting the SDK, you can check if the app crashed in the previous launch:
```
Crashes.hasCrashedInLastSession();
```
This API is asynchronous, you can read more about that in our [Mobile Center Asynchronous APIs guide](https://docs.microsoft.com/en-us/mobile-center/sdk/android-async).
<br>
<br>
This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occured.

### Details about the last crash
If your app crashed previously, you can get details about the last crash.
```
Crashes.getLastSessionCrashReport();
```
This API is asynchronous, you can read more about that in our [Mobile Center Asynchronous APIs guide](https://docs.microsoft.com/en-us/mobile-center/sdk/android-async).
<br>
<br>
There are numerous use cases for this API, the most common one is people who call this API and implement their [custom CrashesListener](https://github.com/jCho23/MobileAzureDevDays/tree/master/Java#use-your-own-crasheslistener).

### Customize your usage of Mobile Center Crashes
Mobile Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to Mobile Center.
<br>
<br>
To handle the callbacks, you must either implement all methods in the ```CrashesListener``` interface, or override the ```AbstractCrashesListener``` class and pick only the ones you're interested in.

#### Use your own CrashesListener
Create your own CrashesListener and assign it like this:
```
CrashesListener customListener = new CrashesListener() {
    // Implement all callbacks here.
};
Crashes.setListener(customListener);
```
In case you are only interested in customizing some of the callbacks, use the ```AbstractCrashesListener``` instead:
```
AbstractCrashesListener customListener = new AbstractCrashesListener() {
    // Implement any callback here as required.
};
Crashes.setListener(customListener);
```

#### Should the crash be processed?
Implement this callback if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to Mobile Center.
```
@Override
public boolean shouldProcess(ErrorReport report) {
     return true; // return true if the crash report should be processed, otherwise false.
}
```

#### Ask for the users' consent to send a crash log
If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to Mobile Center. The SDK exposes a callback that tells Mobile Center Crashes to await your users' confirmation before sending any crash reports.
<br>
<br>
If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always Send, Send,** and **Don't send**. Based on the input, you will tell the Mobile Center Crashes what to do and the crash will then be handled accordingly.
<br>
<br>
No dialog is shown by the SDK, it is up to you to provide UI code if you want to ask for users' consent.
<br>
<br>
The following callback shows how to tell the SDK to wait for user confirmation before sending crashes:
```
@Override
public boolean shouldAwaitUserConfirmation() {

    // Build your own UI to ask for user consent here. SDK does not provide one by default.

    // Return true if you just built a UI for user consent and are waiting for user input on that custom U.I, otherwise false.
    return true;
}
```
If you return ```true```, your app must obtain (using your own code) the user's permission and message the SDK with the result using the following API:
```
// Depending on the user's choice, call Crashes.notifyUserConfirmation() with the right value.
Crashes.notifyUserConfirmation(Crashes.DONT_SEND);
Crashes.notifyUserConfirmation(Crashes.SEND);
Crashes.notifyUserConfirmation(Crashes.ALWAYS_SEND);
```
As an example you can refer to our [custom dialog example](https://github.com/Microsoft/mobile-center-sdk-android/blob/0.12.0/apps/sasquatch/src/main/java/com/microsoft/azure/mobile/sasquatch/activities/MainActivity.java#L218).

#### Get information about the sending status for a crash log
At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. Mobile Center Crashes has three different callbacks that you can use in your app to be notified of what is going on
<br>
<br>
##### The following callback will be invoked before the SDK sends a crash log.
```
@Override
public void onBeforeSending(ErrorReport errorReport) {
    // Your code, e.g. to present a custom UI.
}
```
##### The following callback will be invoked after the SDK sent a crash log successfully.
```
@Override
public void onSendingSucceeded(ErrorReport report) {
    // Your code, e.g. to hide the custom UI.
}
```
##### The following callback will be invoked if the SDK failed to send a crash log.
```
@Override
public void onSendingFailed(ErrorReport report, Exception e) {
    // Your code goes here.
}
```
#### Add attachments to a crash report
You can add **one binary** and **one text** attachment to a crash report. The SDK will send it along with the crash so that you can see it in Mobile Center portal. The following callback will be invoked if you want to add attachments to a crash report. Here is an example to attach a text and an image to a crash:
```
@Override
public Iterable<ErrorAttachmentLog> getErrorAttachments(ErrorReport report) {

    /* Attach some text. */
    ErrorAttachmentLog textLog = ErrorAttachmentLog.attachmentWithText("This is a text attachment.", "text.txt");

    /* Attach app icon. */
    Bitmap bitmap = BitmapFactory.decodeResource(context.getResources(), R.mipmap.ic_launcher);
    ByteArrayOutputStream stream = new ByteArrayOutputStream();
    bitmap.compress(Bitmap.CompressFormat.JPEG, 100, stream);
    byte[] bitMapData = stream.toByteArray();
    ErrorAttachmentLog binaryLog = ErrorAttachmentLog.attachmentWithBinary(bitMapData, "ic_launcher.jpeg", "image/jpeg");

    /* Return attachments as list. */
    return Arrays.asList(textLog, binaryLog);
}
```

### Enable or disable Mobile Center Crashes at runtime
You can enable and disable Mobile Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.
```
Crashes.setEnabled(false);
```
To enable Mobile Center Crashes again, use the same API but pass ```true``` as a parameter.
```
Crashes.setEnabled(true);
```
This API is asynchronous, you can read more about that in our [Mobile Center Asynchronous APIs guide](https://docs.microsoft.com/en-us/mobile-center/sdk/android-async).

### Check if Mobile Center Crashes is enabled
You can also check if Mobile Center Crashes is enabled or not:
```
Crashes.isEnabled();
```
This API is asynchronous, you can read more about that in our [Mobile Center Asynchronous APIs guide](https://docs.microsoft.com/en-us/mobile-center/sdk/android-async).
