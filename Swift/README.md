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

Also note that Crash logs on iOS require Symbolication, please check out the [Mobile Center Crashes Symbols documentation](https://github.com/jCho23/MobileAzureDevDays/tree/master/Swift#uploading-symbols) that explains how to provide symbols for your app.

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

### Register as a delegate
```swift
MSCrashes.setDelegate(self)
```

### Should the crash be processed?
Implement the ```crashes:shouldProcessErrorReport```:-method in the class that adopts the ```MSCrashesDelegate-protocol``` if you'd like to decide if a particular crash needs to be processed or not. For example, there could be a system level crash that you'd want to ignore and that you don't want to send to Mobile Center.
```swift
func crashes(_ crashes: MSCrashes!, shouldProcessErrorReport errorReport: MSErrorReport!) -> Bool {
    return true; // return true if the crash report should be processed, otherwise false.
}
```
### Ask for the users' consent to send a crash log
If user privacy is important to you, you might want to get your users' confirmation before sending a crash report to Mobile Center. The SDK exposes a callback that tells Mobile Center Crashes to await your users' confirmation before sending any crash reports.


If you chose to do so, you are responsible for obtaining the user's confirmation, e.g. through a dialog prompt with one of the following options: **Always Send**, **Send**, and **Don't send**. Based on the input, you will tell the Mobile Center Crashes what to do and the crash will then be handled accordingly.


The following method shows how to set up a user confirmation handler:
```swift
MSCrashes.setUserConfirmationHandler({ (errorReports: [MSErrorReport]) in

    // Your code to present your UI to the user, e.g. an UIAlertView.
   UIAlertView.init(title: "Sorry we crashed!", message: "Do you want to send a Crash Report?", delegate: self, cancelButtonTitle: "No", otherButtonTitles:"Always send", "Send").show()

   return true // Return true if the SDK should await user confirmation, otherwise return false.
})
```
In case you return ```YES/true``` in the handler block above, your app should obtain user permission and message the SDK with the result using the following API. If you are using an alert for this, as we do in the sample above, you would call it from within your implementation of the ```alertView:clickedButtonAtIndex:```-callback. 
```swift
// Depending on the user's choice, call notify(with:) with the right value.
MSCrashes.notify(with: MSUserConfirmation.dontSend)
MSCrashes.notify(with: MSUserConfirmation.send)
MSCrashes.notify(with: MSUserConfirmation.always)
```

### Get information about the sending status for a crash log

At times, you would like to know the status of your app crash. A common use case is that you might want to show UI that tells the users that your app is submitting a crash report, or, in case your app is crashing very quickly after the launch, you want to adjust the behavior of the app to make sure the crash logs can be submitted. The ```MSCrashesDelegate```-protocol defines three different callbacks that you can use in your app to be notified of what is going on:

#### The following callback will be invoked before the SDK sends a crash log
```swift
func crashes(_ crashes: MSCrashes!, willSend errorReport: MSErrorReport!) {
   // Your code, e.g. to present a custom UI.
}
```

#### The following callback will be invoked after the SDK sent a crash log successfully
```swift
func crashes(_ crashes: MSCrashes!, didSucceedSending errorReport: MSErrorReport!) {
    // Your code goes here.
}
```

#### The following callback will be invoked if the SDK failed to send a crash log
```swift
func crashes(_ crashes: MSCrashes!, didSucceedSending errorReport: MSErrorReport!) {
    // Your code goes here.
}
```

### Add attachments to a crash report

You can add **one binary** and **one text** attachment to a crash report. The SDK will send it along with the crash so that you can see it in Mobile Center portal. The following callback will be invoked if you want to add attachments to a crash report:
```swift
func attachments(with crashes: MSCrashes, for errorReport: MSErrorReport) -> [MSErrorAttachmentLog] {
    let attachment1 = MSErrorAttachmentLog.attachment(withText: "Hello world!", filename: "hello.txt")
    let attachment2 = MSErrorAttachmentLog.attachment(withBinary: "Fake image".data(using: String.Encoding.utf8), filename: nil, contentType: "image/jpeg")
    return [attachment1!, attachment2!]
}
```

## Disabling Mach exception handling
By default, Mobile Center Crashes uses the Mach exception handler to catch fatal signals, e.g. stack overflows, via a Mach exception server.


The ```disableMachExceptionHandler```-method provides an option to disable catching fatal signals via a Mach exception server. If you want to disable the Mach exception handler, you should call this method BEFORE starting the SDK. Your typical setup code would look like this:  
```swift
MSCrashes.disableMachExceptionHandler()
MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
```
  
## Enable or disable Mobile Center Crashes at runtime  
You can enable and disable Mobile Center Crashes at runtime. If you disable it, the SDK will not do any crash reporting for the app.
```swift
MSCrashes.setEnabled(false)
```

To enable Mobile Center Crashes again, use the same API but pass ```YES/true``` as a parameter.
```swift
MSCrashes.setEnabled(true)
```

## Check if Mobile Center Crashes is enabled
You can also check if Mobile Center Crashes is enabled or not:
```swift
var enabled = MSCrashes.isEnabled()
```

# Mobile Center Distribute
Mobile Center Distribute will let your users install a new version of the app when you distribute it via Mobile Center. With a new version of the app available, the SDK will present an update dialog to the users to either download or postpone the new version. Once they choose to update, the SDK will start to update your application. 


This feature will NOT work if your app is deployed to the app store.

## Add in-app updates to your app
Please follow the Get started section if you haven't configured the SDK in your application.

### 1. Add the Mobile Center Distribute module

The Mobile Center SDK is designed with a modular approach – you only need to integrate the modules of the services that you're interested in.

#### Integration via Cocoapods
If you are integrating Mobile Center into your app via Cocoapods, add the following dependency to your podfile and run ```pod install```.
```ruby
pod 'MobileCenter/Distribute'
```

#### Integration by copying the binaries into your project
If you wish to manually integrate the module, follow this [documentation link](https://docs.microsoft.com/en-us/mobile-center/sdk/distribute/ios-manual-integration).

### 2. Start Mobile Center Distribute
In order to use Mobile Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

#### 2.1 Add the import for Mobile Center Distribute
Open your AppDelegate.m file in Objective-C or AppDelegate.swift file in Swift and add the following import statements:
```swift
import MobileCenter
import MobileCenterDistribute
```

#### 2.2 Add the ```start:withServices```: method
Add ```MSDistribute``` to your ```start:withServices```: method to start Mobile Center Distribute service.

Insert the following line to start the SDK in your app's **AppDelegate.m** class for Objective-C or ```AppDelegate.swift``` class for Swift in the d```idFinishLaunchingWithOptions``` method.
```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSDistribute.self])
```
Make sure you have replaced ```{Your App Secret}``` in the code sample above with your App Secret. Please also check out the [Get started](https://github.com/jCho23/MobileAzureDevDays/tree/master/Swift#get-started-with-ios) section if you haven't configured the SDK in your application.

#### 2.3 Modify your Info.plist
  1) Add a new key for ```URL types``` or ```CFBundleURLTypes``` in your ```Info.plist``` file (in case Xcode displays your Info.plist as source code).
  2) Change the key of the first child item to ```URL Schemes``` or ```CFBundleURLSchemes```.
  3) Enter ```mobilecenter-${APP_SECRET}``` as the URL scheme and replace ```${APP_SECRET}``` with the App Secret of your app.
  4) If you want to verify that you modified the Info.plist correctly, open it as source code. It should contain the following entry with your App Secret instead of ```${APP_SECRET}```:
  ```swift
  <key>CFBundleURLTypes</key>
  <array>
      <dict>
          <key>CFBundleURLSchemes</key>
          <array>
              <string>mobilecenter-${APP_SECRET}</string>
          </array>
      </dict>
  </array>
  ```
  
## Customize or localize the in-app update dialog

### 1. Customize or localize text

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at this [strings file](https://github.com/Microsoft/mobile-center-sdk-ios/blob/develop/MobileCenterDistribute/MobileCenterDistribute/Resources/en.lproj/MobileCenterDistribute.strings). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app strings files.

### 2. Customize the update dialog

You can customize the default update dialog's appearance by implementing the ```MSDistributeDelegate``` protocol. You need to register the delegate before starting the SDK as shown in the following example:
```swift
MSDistribute.setDelegate(self);
```

Here is an example of the delegate implementation that replaces the SDK dialog with a custom one:
```swift
func distribute(_ distribute: MSDistribute!, releaseAvailableWith details: MSReleaseDetails!) -> Bool {

  // Your code to present your UI to the user, e.g. an UIAlertView.
  UIAlertView.init(title: "Update available", message: "Do you want to update?", delegate: self, cancelButtonTitle: "Postpone", otherButtonTitles: "Update").show()
  return true;
}
```

In case you return ```YES/true``` in the above method, your app should obtain user's choice and message the SDK with the result using the following API.
```swift
// Depending on the user's choice, call notify() with the right value.
MSDistribute.notify(MSUpdateAction.update);
MSDistribute.notify(MSUpdateAction.postpone);
```
If you don't call the above method, the ```releaseAvailableWithDetails:```-method will repeat whenever your app is entering to the foreground.
  
## Enable or disable Mobile Center Distribute at runtime
You can enable and disable Mobile Center Distribute at runtime. If you disable it, the SDK will not provide any in-app update functionality but you can still use Distribute service in Mobile Center portal.
```swift
MSDistribute.setEnabled(false)
```
To enable Mobile Center Distribute again, use the same API but pass ```YES/true``` as a parameter.
```swift
MSDistribute.setEnabled(true)
```

## Check if Mobile Center Distribute is enabled
You can also check if Mobile Center Distribute is enabled or not:
```swift
var enabled = MSDistribute.isEnabled()
```

## Don't initialize Mobile Center Distribute during development
Mobile Center Distribute will pop up it's UI/browser at application start. While this is an expected behavior for your end users, it could be disruptive for you during the development stage of your application. We do not recommend to initialize ```MSDistribute``` for your ```DEBUG``` configuration.
```swift
#if DEBUG
   MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self])
#else
   MSMobileCenter.start("{Your App Secret}", withServices: [MSAnalytics.self, MSCrashes.self, MSDistribute.self])
#endif
```

## How do in-app updates work?
The in-app updates feature works as follows:
  1) This feature will ONLY work with builds that are distributed using **Mobile Center Distribute** service. It won't work when the debugger is attached.
  2) Once you integrate the SDK, build a release version of your app and upload it to Mobile Center, users in that distribution group will be notified for the new release via an email.
  3) When each user opens the link in their email, the application will be installed on their device. It's important that they use the email link to install the app - Mobile Center Distribute does not support in-app-updates for apps that have been installed from other sources (e.g. downloading the app from an email attachment)
  4) Once the app is installed and opened for the first time after the Mobile Center Distribute SDK has been added, a browser will open to enable in-app updates. This is a one time step that will not occur for subsequent releases of your app.
              * On iOS 8 and 9, the user will be redirected to the Safari app where they will be authenticated, and then redirected to the app.
              * On iOS 10, an instance of ```SFSafariViewController``` will open within the app to authenticate the user. It will close itself automatically after the authentication succeeded.
              * On iOS 11, the user experience is similar to iOS 10 but iOS 11 will ask the user for their permission to access login information. This is a system level dialog and it cannot be customized. If the user cancels the dialog, they can continue to use the version they are testing, but they won't get in-app-updates. They will be asked to access login information again when they launch the app the next time.
  5) Once the above step is successful, they should be navigated back to the app.
  6) A new release of the app shows the in-app update dialog asking users to update your application if it has
              * a higher value of ```CFBundleShortVersionString``` or
              * an equal value of ```CFBundleShortVersionString``` but a higher value of ```CFBundleVersion```.
  7) If you upload the same ipa a second time, the dialog will **NOT** appear as the binaries are identical. If you upload a **new** build with the same version properties, it will show the update dialog. The reason for this is that it is a **different** binary.

## How do I test in-app updates?
You need to upload release builds (that use the Distribute module of the Mobile Center SDK) to the Mobile Center Portal to test in-app updates, increasing version numbers every time.
  1) Create your app in the Mobile Center Portal if you have not done that already.
  2) Create a new distribution group and name it so you can recognize that this is just meant for testing the in-app update feature.
  3) Add yourself (or all people who you want to include on your test of the in-app update feature). Use a new or throw-away email address for this, that was not used for that app on Mobile Center. This ensures that you have an experience that's close to the experience of your real testers.
  4) Create a new build of your app that includes **Mobile Center Distribute** and contains the setup logic as described below.
  5) Click on the **Distribute new release** button in the portal and upload your build of the app
  6) Once the upload has finished, click **Next** and select the **Distribution group** that you just created as the **Destination** of that app distribution.
  7) Review the Distribution and distribute the build to your in-app testing group.
  8) People in that group will receive an invite to be testers of the app. Once they need to accept the invite, they can download the app from the Mobile Center Portal from their mobile device. Once they have in-app updates installed, you're ready to test in-app updates.
  9) Bump the version name (```CFBundleShortVersionString```) of your app.
  10) Build the release version of your app and upload a new build of your app just like you did in the previous step and distribute this to the Distribution Group you created earlier. Members of the **Distribution Group** will be prompted for a new version the next time the app enters the foreground.

## Disable automatic forwarding of application delegate's methods to Mobile Center services
Mobile Center uses swizzling to automatically forward your application delegate's methods to Mobile Center services to improve SDK integration. There is a possibility of conflicts with other third party libraries or the application delegate itself. In this case, you might want to disable the Mobile Center application delegate forwarding for all Mobile Center services by following the steps below:
  1) Open your ```Info.plist``` file.
  2) Add ```MobileCenterAppDelegateForwarderEnabled``` key and set the value to ```0```. This will disable application delegate forwarding for all Mobile Center services.
  3) Add ```openURL``` callback in your ```AppDelegate``` file.
```swift
func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {

  // Pass the URL to MSDistribute.
  return MSDistribute.open(url as URL!)
}
```






# Mobile Center Push
Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal.

## Prerequisite - Enable Apple Push Notifications service (APNs) for your app
Configure Apple Push Notifications service (APNs) for your app from your Apple developer account and Mobile Center portal before adding Mobile Center Push to your app.

### Enable push notifications on your application

In Xcode's project editor, choose your target and click **Capabilities**. In the **Push Notifications** section, click the switch to turn it from OFF to ON.

### Set up APNs

* Log in to the Mobile Center portal, select your application, click on the **Push** button from the left menu then click **Next** to reveal the push notification settings UI.
* On the bottom of the page, select Sandbox for initial development or Production for production version of your application.
* Collect the following information:

#### Prefix and ID
1) Go to your Apple developer account and select your application from the [App ID](https://idmsa.apple.com/IDMSWebAuth/login?appIdKey=891bd3417a7776362562d2197f89480a8547b108fd934911bcbea0110d07f757&path=%2Faccount%2Fios%2Fidentifier%2Fbundle&rv=1) list in **Identifiers**.
2) Copy the **Prefix** value from this window and paste it to the Mobile Center push settings.
3) Do the same with the **ID** value.
  
#### Key ID
  1) In your Apple developer account [create a new key](https://idmsa.apple.com/IDMSWebAuth/login?appIdKey=891bd3417a7776362562d2197f89480a8547b108fd934911bcbea0110d07f757&path=%2Faccount%2Fios%2Fauthkey%2Fcreate&rv=1) in **Certificates, Identifiers & Profiles/Keys**.
  2) Make sure to check the APNs checkbox.
  3) Fill in the key name
  4) Press **Continue** then **Confirm**.
  5) On the next screen, copy the **Key ID** value and paste it to the Mobile Center push settings.
  6) Download the key file.

#### Push Token
  1) Open your key file with a text editor and copy the authentication token it contains.
  2) On the Mobile Center push settings, paste this token to the **Push Token** field then click **Done** to complete this configuration. For more information, refer to the [Apple documentation](http://help.apple.com/xcode/mac/current/#/dev11b059073).
  
#### [Optional] Enable silent notifications  
Silent notifications give you a way to wake up your app so that it can refresh its data in the background (see [Apple documentation](https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CreatingtheNotificationPayload.html#//apple_ref/doc/uid/TP40008194-CH10-SW8). To enable silent notifications open Xcode's project editor, choose your target and click **Capabilities**. Turn on **Background Modes** and check the **Remote notifications** checkbox.

## Add Mobile Center Push to your app

### 1. Add the Mobile Center Push module

The Mobile Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

#### Integration via Cocoapods
If you are integrating Mobile Center into your app via Cocoapods, add the following dependency to your podfile and run ```pod install```.
```swift
pod 'MobileCenter/Push'
```
#### Integration by copying the binaries into your project
If you wish to manually integrate the module, follow this [documentation link](https://docs.microsoft.com/en-us/mobile-center/sdk/push/ios-manual-integration).

### 2.Start Mobile Center Push

In order to use Mobile Center, you need to opt in to the service(s) that you want to use, meaning by default no services are started and you will have to explicitly call each of them when starting the SDK.

#### 2.1 Add the import for Mobile Center Push
Open your AppDelegate.m file in Objective-C or AppDelegate.swift file in Swift and add the following import statements:
```swift
import MobileCenter
import MobileCenterPush
```

#### 2.2 Add the ```start:withServices:``` method
Add ```MSPush``` to your ```start:withServices:``` method to start Mobile Center Distribute together with the other services that you want to use in your app.

Insert the following line to start the SDK in your app's ```AppDelegate.m``` class in Objective-C or ```AppDelegate.swift``` class in Swift in the ```didFinishLaunchingWithOptions``` method.
```swift
MSMobileCenter.start("{Your App Secret}", withServices: [MSPush.self])
```

Make sure you have replaced ```{Your App Secret}``` in the code sample above with your App Secret. Please also check out the [Get started section](https://github.com/jCho23/MobileAzureDevDays/tree/master/Swift#get-started-with-ios) if you haven't configured the SDK in your application.

#### 2.3 [Optional] 
Receive push notifications if you have already implemented ```application:didReceiveRemoteNotification:fetchCompletionHandler``` method

If you or one of your third party libraries already implements ```application:didReceiveRemoteNotification:fetchCompletionHandler``` method, then follow step 4 to implement a callback to receive push notifications.

## Intercept push notifications
You can set up a delegate to be notified whenever a push notification is received in foreground or a background push notification has been tapped by the user. The delegate may also be woken up when a notification is received in background if you have enable [silent notifications](https://docs.microsoft.com/en-us/mobile-center/sdk/push/ios#optional-enable-silent-notifications) and if the payload of the notification contains the [content-available](https://docs.microsoft.com/en-us/mobile-center/push/index#custom-data-in-your-notifications) flag set to true.

By default, iOS does not generate notifications when the push is received in foreground, you can use the delegate to customize the push experience when received in foreground or do a specific action when the application is launched by clicking on the push notification when received in background.

You need to register the delegate before starting MobileCenter as shown in the following example:
```swift
MSPush.setDelegate(self)
MSMobileCenter.start("{Your App Secret}", withServices: [MSPush.self])
```
Here is an example of the delegate implementation that displays an alert dialog when the message is received in foreground or a background push notification has been clicked:
```swift
func push(_ push: MSPush!, didReceive pushNotification: MSPushNotification!) {
  let title: String? = pushNotification.title
  var message: String = pushNotification.message ?? ""
  var customData: String = ""
  for item in pushNotification.customData {
    customData =  ((customData.isEmpty) ? "" : "\(customData), ") + "\(item.key): \(item.value)"
  }
  if (UIApplication.shared.applicationState == .background) {
    NSLog("Notification received in background, title: \"\(title ?? "")\", message: \"\(message)\", custom data: \"\(customData)\"");
  } else {
    message =  message + ((customData.isEmpty) ? "" : "\n\(customData)")
    let alert = UIAlertView(title: title, message: message, delegate: self, cancelButtonTitle: "OK")
    alert.show()
  }
}
```

## Enable or disable Mobile Center Push at runtime
You can enable and disable Mobile Center Push at runtime. If you disable it, the SDK will stop updating the device token used to push but the existing one will continue working. In other words, disabling the Mobile Center Push in the SDK will NOT stop your application from receiving push notifications.
```swift
MSPush.setEnabled(false)
```

To enable Mobile Center Push again, use the same API but pass ```YES/true``` as a parameter.
```swift
MSPush.setEnabled(true)
```

## Check if Mobile Center Push is enabled
You can also check if Mobile Center Push is enabled or not:
```swift
var enabled = MSPush.isEnabled()
```

## Disable automatic forwarding of application delegate's methods to Mobile Center services
Mobile Center uses swizzling to automatically forward your application delegate's methods to Mobile Center services to improve SDK integration. There is a possibility of conflicts with other third party libraries or the application delegate itself. In this case, you might want to disable the Mobile Center application delegate forwarding for all Mobile Center services by following the steps below:

  1) Open your ```Info.plist``` file.
  2) Add ```MobileCenterAppDelegateForwarderEnabled``` key and set the value to ```0```. This will disable application delegate forwarding for all Mobile Center services.
  3) Implement the callbacks to register push notifications. Implement ```application:didRegisterForRemoteNotificationsWithDeviceToken:``` callback and the                                 ```application:didFailToRegisterForRemoteNotificationsWithError:``` callback in your ```AppDelegate``` to register for Push notifications.
```swift
func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {

  // Pass the device token to MSPush.
  MSPush.didRegisterForRemoteNotifications(withDeviceToken: deviceToken)
}

func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {

  // Pass the error to MSPush.
  MSPush.didFailToRegisterForRemoteNotificationsWithError(error)
}
```
  4) Implement the callback to receive push notifications
Implement the ```application:didReceiveRemoteNotification:fetchCompletionHandler``` callback to forward push notifications to the Push service.















