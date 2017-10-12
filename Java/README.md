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


