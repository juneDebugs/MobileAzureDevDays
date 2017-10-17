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
<br>
<br>
Open your ```AppDelegate.m``` file and add the following import statements:
```obj-c
@import MobileCenter;
@import MobileCenterAnalytics;
@import MobileCenterCrashes;
```
**Swift**
<br>
<br>
Open your ```AppDelegate.swift``` file and add the following import statements:
```swift
import MobileCenter
import MobileCenterAnalytics
import MobileCenterCrashes
```

### 4.2 Add the start:withServices: method
**Objective-C**
<br>
<br>
Insert the following line to start the SDK in your app's ```AppDelegate.m class``` in the ```didFinishLaunchingWithOptions``` method.
```obj-c
[MSMobileCenter start:@"{Your App Secret}" withServices:@[[MSAnalytics class], [MSCrashes class]]];
```

**Swift**
Insert the following line to start the SDK in your app's ```AppDelegate.swift``` class in the ```didFinishLaunchingWithOptions``` method.
```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
```


  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
