# Abstract
This simple app has a Text Entry Box and a button that triggers the text to hit the [Azure Sentiment Analysis API](https://docs.microsoft.com/en-us/azure/cognitive-services/text-analytics/how-tos/text-analytics-how-to-sentiment-analysis) and returns a corresponding Emoji and changes the background color appropriately.

# Get Started with iOS
The Mobile Center SDK uses a modular architecture so you can use any or all of the services.
<br>
<br>
Let's get started with setting up Mobile Center iOS SDK in your app to use Mobile Center Analytics and Mobile Center Crashes

## 1. Prerequisites
Before you begin, please make sure that the following prerequisites are met:
* Your iOS project is set up in Xcode 8 or later on macOS version 10.12.
* You are targeting devices running on iOS 8.0 or later.
* You are not using any other library that provides Crash Reporting functionality.

## 2. Create your app in the Mobile Center Portal to obtain the App Secret
If you have already created your app in the Mobile Center portal, you can skip this step.
  1) Head over to [mobile.azure.com](https://mobile.azure.com).
  2) Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
  3) Enter a name and an optional desciption for your app.
  4) Select **iOS** as the OS and **Objective-C/Swift** as a platform.
  5) Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the Mobile Center Portal.

## 3. Add the Mobile Center SDK modules
The Mobile Center SDK for iOS can be integrated into your app via [Cocoapods](https://cocoapods.org/) or by manually adding the binaries to your project.

### 3.1 Integration via Cocoapods

  1) Add the following dependencies to your ```podfile``` to include Mobile Center Analytics and Mobile Center Crashes into your app. This will pull in the following frameworks: **MobileCenter**, **MobileCenterAnalytics**, and **MobileCenterCrashes**. Alternatively, you can specify which services you want to use in your app. Each service has it's own subspec and they all rely on MobileCenter. It will get pulled in automatically.
  ```ruby
  # Use the following line to use Mobile Center Analytics and Crashes.
pod 'MobileCenter'

# Use the following lines if you want to specify which service you want to use.
pod 'MobileCenter/Analytics'
pod 'MobileCenter/Crashes'
```
  2) Run pod install to install your newly defined pod and open your ```.xcworkspace```.
  
  Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the Mobile Center services.
  
### 3.2 Integration by copying the binaries into your project

Below are the steps on how to integrate the compiled binaries in your Xcode project to set up Mobile Center Analytics and Mobile Center Crashes for your iOS app
  1) Download the [Mobile Center iOS SDK](https://github.com/Microsoft/mobile-center-sdk-ios/releases) frameworks provided as a zip file.
  2) Unzip the file and you will see a folder called ```MobileCenter-SDK-Apple/iOS``` that contains different frameworks for each Mobile Center service. The framework called ```MobileCenter``` is required in the project as it contains code that is shared between the different modules.
  3) [Optional] Create a subdirectory for 3rd-party libraries.
  
     * As a best practice, 3rd-party libraries usually reside inside a subdirectory (it is often called **Vendor**), so if you don't have your project organized with a subdirectory for libraries, create a Vendor subdirectory now.
     * Create a group called **Vendor** inside your Xcode project to mimic your file structure on disk.  
  4) Open Finder and copy the previously unzipped ```MobileCenter-SDK-Apple/iOS folder``` into your project's folder at the location where you want it to reside.
  
  5) Add the SDK frameworks to the project in Xcode:
      * Make sure the Project Navigator is visible (⌘+1).
      * Now drag and drop **MobileCenter.framework**, **MobileCenterAnalytics.framework**, and **MobileCenterCrashes.framework** from the Finder (in the location from the previous step) into Xcode's Project Navigator. Note that MobileCenter.framework is required to start the SDK, make sure it is added to your project, otherwise the other modules won't work and your app won't compile.
      * A dialog will appear, make sure your app target is checked. Then click **Finish**.

Now that you've integrated the frameworks in your application, it's time to start the SDK and make use of the Mobile Center services.

## 4. Start the SDK
In order to use Mobile Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

### 4.1 Add the import statements

**Objective-C**

Open your ```AppDelegate.m``` file and add the following import statements:
```obj-c
@import MobileCenter;
@import MobileCenterAnalytics;
@import MobileCenterCrashes;
```
**Swift**

Open your ```AppDelegate.swift``` file and add the following import statements:
```swift
import MobileCenter
import MobileCenterAnalytics
import MobileCenterCrashes
```

### 4.2 Add the start:withServices: method
**Objective-C**

Insert the following line to start the SDK in your app's ```AppDelegate.m class``` in the ```didFinishLaunchingWithOptions``` method.
```obj-c
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
```

**Swift**

Insert the following line to start the SDK in your app's ```AppDelegate.swift``` class in the ```didFinishLaunchingWithOptions``` method.
```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
```

### Replace the placeholder with your App Secret
Make sure to replace ```{Your App Secret}``` text with the actual value for your application. The App Secret can be found on the **Getting Started** page on the Mobile Center portal or through the **Manage App** button.


The Getting Started page contains the above code sample with your App Secret in it, you can just copy-paste the whole sample.

The example above shows how to use the ```start:withServices``` method and include both Mobile Center Analytics and Mobile Center Crashes.

If you do not want to use one of the two services, remove the corresponding parameter from the method call above.
Note that, unless you explicitly specify each module as parameters in the start method, you can't use that Mobile Center service. In addition, the ```start:withServices``` API can be used only once in the lifecycle of your app – all other calls will log a warning to the console and only the modules included in the first call will be available.

For example - If you just want to onboard to Mobile Center Analytics, you should modify the ```start:withServices``` API call as follows:

**Objective-C**
```obj-c
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class]]];
```

**Swift**
```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self])
```
Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically.
  
  
  
  
  
  

# Mobile Center Analytics
Mobile Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the Mobile Center portal for you to analyze the data.

Please follow the Get started section if you haven't set up the SDK in your application yet.

## Session and device information
Once you add Mobile Center Analytics to your app and start the SDK, it will automatically track sessions and device properties like OS Version, model, etc. without any additional code.

## Custom events
You can track your own custom events with **up to five properties** to know what's happening in your app, understand user actions, and see the aggregates in the Mobile Center portal.


Once you have started the SDK, use the ```trackEvent:withProperties``` method to track your events with properties. You can send **up to 200 distinct event names**. Also, there is a maximum limit of 256 characters per event name and 64 characters per event property name and event property value.
```swift
MSAnalytics.trackEvent("Video clicked", withProperties: ["Category" : "Music", "FileName" : "favorite.avi"])
```

Properties for events are entirely optional – if you just want to track an event, use this sample instead:
```swift
MSAnalytics.trackEvent("Video clicked")
```

## Enable or disable Mobile Center Analytics at runtime
You can enable and disable Mobile Center Analytics at runtime. If you disable it, the SDK will not collect any more analytics information for the app.2
```swift
MSAnalytics.setEnabled(false)
```
To enable Mobile Center Analytics again, use the same API but pass ```YES/true``` as a parameter.
```swift
MSAnalytics.setEnabled(true)
```

## Check if Mobile Center Analytics is enabled
You can also check if Mobile Center Analytics is enabled or not.
```swift
MSAnalytics.isEnabled()
```




# Mobile Center Crashes
Mobile Center Crashes will automatically generate a crash log every time your app crashes. The log is first written to the device's storage and when the user starts the app again, the crash report will be sent to Mobile Center. Collecting crashes works for both beta and live apps, i.e. those submitted to the App Store. Crash logs contain valuable information for you to help fix the crash

Please follow the Getting Started section if you haven't set up the SDK in your application yet.

Also note that Crash logs on iOS require Symbolication, please check out the Mobile Center Crashes documentation that explains how to provide symbols for your app.

## Uploading symbols
  1) Create a ZIP file for the dSYM package on your Mac.
  2) Open the Incoming page under Crash Reporting on Mobile Center of the app.
  3) Upload the zip file.
  4) After the zip file is indexed by Mobile Center new incoming crashes will be symbolicated.


## Generate a test crash
Mobile Center Crashes provides you with an API to generate a test crash for easy testing of the SDK. This API can only be used in test/beta apps and won't do anything in production apps.
```swift
MSCrashes.generateTestCrash()
```

## Get more information about a previous crash
Mobile Center Crashes has two APIs that give you more information in case your app has crashed.

### Did the app crash in the previous session?
At any time after starting the SDK, you can check if the app crashed in the previous launch:
```swift
MSCrashes.hasCrashedInLastSession()
```
This comes in handy in case you want to adjust the behavior or UI of your app after a crash has occured. Some developers chose to show additional UI to apologize to their users, or want way to get in touch after a crash has occured.

### Details about the last crash
If your app crashed previously, you can get details about the last crash.
```swift
var crashReport = MSCrashes.lastSessionCrashReport()
```
There are numerous use cases fpr this API, the most common one is people who call this API and implement their custom [MSCrashesDelegate](https://docs.microsoft.com/en-us/mobile-center/sdk/crashes/ios#customize-your-usage-of-mobile-center-crashes).

## Customize your usage of Mobile Center Crashes
Mobile Center Crashes provides callbacks for developers to perform additional actions before and when sending crash logs to Mobile Center.

To add your custom behavior, you need to adopt the ```MSCrashesDelegate-protocol```, all of it's methods are optional.


  
  
  
  
  
  
  
  
