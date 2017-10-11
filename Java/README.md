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
