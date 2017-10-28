# Abstract
This simple app has a Text Entry Box and a button that triggers the text to hit the [Azure Sentiment Analysis API](http://bit.ly/2i9jc13) and returns a corresponding Emoji and changes the background color appropriately.

# Index
* [Get Started with iOS](http://bit.ly/2gww4ho)
     * [Prerequisites](http://bit.ly/2l3uHIf)
* [Build](http://bit.ly/2xSmh7H)
     * [Building Xcode iOS apps](http://bit.ly/2inkRAd)
* [Test](http://bit.ly/2yCKpPU)
     * [Getting Started with Test Cloud](http://bit.ly/2zBQiLr)
* [Analytics](http://bit.ly/2znBOxA)
     * [Custom events](http://bit.ly/2zo3hPT)
* [Crashes](http://bit.ly/2hQgg5K)
     * [Customize your usage of Mobile Center Crashes](http://bit.ly/2zm9Mml) 
* [Distribute](http://bit.ly/2yzQEBV)
     * [Add in-app updates to your app](http://bit.ly/2yBHO6Y) 
* [Push Notifications](http://bit.ly/2gpkgto)
     * [Enable Apple Push Notifications service (APNs) for your app](http://bit.ly/2gpIAvi)



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
  1) Head over to [mobile.azure.com](http://bit.ly/2ygLNrH).
  2) Sign up or log in and hit the blue button on the top right corner of the portal that says **Add new** and select **Add new app** from the dropdown menu.
  3) Enter a name and an optional desciption for your app.
  4) Select **iOS** as the OS and **Objective-C/Swift** as a platform.
  5) Hit the button at the bottom right that says **Add new app**.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App** sections of the Mobile Center Portal.

## 3. Add the Mobile Center SDK modules
The Mobile Center SDK for iOS can be integrated into your app via [Cocoapods](http://bit.ly/2l0WWrb) or by manually adding the binaries to your project.

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
  1) Download the [Mobile Center iOS SDK](http://bit.ly/2zmwrPb) frameworks provided as a zip file.
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
  
  
  
  
  
  
  
# Mobile Center Build  
Mobile Center helps you build the mobile apps you and your team is working on, using a secure infrastructure. You can forget about configuring build servers locally, complicated configurations and code that is working on a co-worker's machine, but not working on yours.

## Building Xcode iOS apps
To start building a native iOS app, you will firstly need to connect to your repository service account (GitHub, Bitbucket, VSTS), select a repository and a branch where your app lives and then you can set up your first build. Choose the Xcode project or workspace and the scheme that you would like to build; for the app to run on a real device, the build needs to be code signed with a valid provisioning profile and a certificate.

### 1. Linking your repository
If you haven't previously connected to your repository service (GitHub, Bitbucket, VSTS) account, you will firstly need to do this. Once your account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull rights for it.

### 2. Selecting a branch
The next step once you have selected a repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

### 3. Setting up your first build
To kick off the first build, configure how the iOS project should get built.

#### 3.1. Project/workspace and scheme

For a build configuration, an Xcode project or an Xcode workspace and a shared scheme are required. Mobile Center automatically detects the projects, workspaces and shared schemes in your branch. Select the project or the workspace you want to build and the corresponding scheme. If no scheme can be found, make sure that the scheme you want to build with is shared and that the container for the scheme is the project or the workspace you have selected and that these changes are checked into the branch you are setting up the build for.

#### 3.2. Xcode version

Select the Xcode version to run the build on.

#### 3.3. Build triggers

By default a new build is triggered on every push a developer does to the configured branch. This is often referred to as "Continuous Integration". If you prefer to trigger a new build manually, you can change this setting in the configuration pane.

#### 3.4. Increment build number

When enabled, the ```CFBundleVersion``` in the Info.plist of your app automatically increments for each build. The change happens pre build and won't be committed to your repository.

#### 3.5. Tests

If the selected scheme has a test action with a test target selected, you can configure to run the tests as part of each build. Mobile Center can currently run XCTest unit tests.


#### 3.6. Code signing

A successful build will produce a .ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and [upload a provisioning profile (.mobileprovision) and a valid certificate (.p12)](http://bit.ly/2g8RjSF), along with the password for the certificate. The settings in your Xcode project need to be compatible with the files you are uploading. You can read more about [code signing here](http://bit.ly/2yJfJxj) and in the [official Apple Developer documentation](http://apple.co/2yV5Ts6).

#### 3.7. Launch your successful build on a real device

Use your newly produced IPA file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. [Read more about it here](http://bit.ly/2yk8SaG).

#### 3.8. CocoaPods

Mobile Center scans the selected branch and if it finds a Podfile, it will automatically do a pod install step at the beginning of every build. This will ensure that all dependencies are installed. If the repository already contains a /Pods folder, Mobile Center assumes you have checked in the pods in your repository and will no longer perform ```pod install```.

#### 3.9. Distribution to a distribution group**

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
```swift
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1> (e.g. 2_Get Sources.txt)
    |-- <build-step-2> (e.g. 3_Pod install.txt)
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt)
```    
The build step specific logs (located in the ```build/``` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

#### 4.2. The app (.ipa)

The .ipa is an iPhone application archive file which contains the iOS app.

* If the build has been signed correctly, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. More details about code signing and distribution with Mobile Center [can be found here](http://bit.ly/2yJfJxj).
* If the build has not been signed, the .ipa can be signed by the developer (e.g. locally using codesign) or used for other purposes (e.g. upload to Test service for UI testing on real devices or run in the simulator)
* All builds kicked off after May 17th are generated by [xcodebuild](http://bit.ly/2yzQ9bc). Unsigned builds will not produce an. ipa file. The artifact of an unsigned build is the .xcarchive file which can be used to generate an .ipa file with the Xcode Archives organizer.

#### 4.3. The symbols file (.dsym)

The .dsym files contain the debug symbols for the app.
* If you have previously integrated the Mobile Center SDK in your app with the crash reporting module enabled, the crash reporting service requires this .dsym file for a build in order to display human readable (symbolicated) crash reports
* If you have previously integrated another SDK for crash reporting purposes in your app (e.g. HockeyApp SDK), the corresponding service requires the .dsym file in order to display human readable (symbolicated) crash reports.

Keep in mind that the .dsym files do not change upon code signing the .ipa. If you decide to code sign the build later, the .dsym generated before code signing is still valid.

## Supported versions and requirements
The following versions of Xcode are currently supported on our VMs:
* Xcode 8.3.3
* Xcode 8.3.2
* Xcode 8.3.1
* Xcode 8.2.1
* Xcode 8.2
* Xcode 8.1
* Xcode 8.0

The build machines are running OS X 10.11.6 (15G1004). We keep an eye on the latest versions released by Apple and include them as soon as possible on the VMs used to run the builds.
  
  
  
  
  
  
  
  
  
  
  
# Mobile Center Test

## Getting Started with Test Cloud
The prerequisite steps below must be completed before a project can be used with Mobile Center Test Cloud.
  1. Create a Mobile Center account
Create a Mobile Center account at [mobile.azure.com](http://bit.ly/2ygLNrH) to gain access to Test Cloud.
  2. Install the Mobile Center CLI
Test runs are executed using the Mobile Center CLI. If not already installed, follow [these instructions](http://bit.ly/2gClGRM) to install. After installation, run mobile-center login to link a Mobile Center account with the tool.
  3. Create an app in Mobile Center
All test assets and operations are within the context of an app. Create the app project to be tested.
  4. Review the core concepts
Understanding the core concepts of the Test Cloud experience improve ease of use, navigation, and communications with support. It is recommended to become familiar with [these concepts](http://bit.ly/2xDn38x) before running your first tests.
  5. Prepare the project for upload
Each test framework has different requirements for uploading to Test Cloud. Follow the appropriate test framework branch from [this page.](http://bit.ly/2yhxeBC)
  
## Starting a Test Run
This section provides instructions for initiating a test run with test suites that have been prepared for upload. To learn how to prepare a test suite for upload to Test Cloud, see [preparing tests for upload.](http://bit.ly/2yhxeBC) <br>

Initiating a test run in Test Cloud requires the [Mobile Center CLI tool.](http://bit.ly/2gClGRM) <br>

With the Mobile Center CLI tool installed and upload preparation complete, initiating a test run is very straightforward as the UI will guide you through the necessary steps. Begin by navigating to the Test Cloud section within the desired app. Clicking the ```new test run``` button will launch a dialog which will lead you through the 3 steps of preparing a test run.

### Device selection
Select the devices against which this test run should execute. This collection of devices can optionally be saved as a set for future use. To save the set, follow the on-screen prompts.

### Test run configuration
Select the test framework, set the device locale, and select a test series. Device locale will determine the system-level device settings, such as language. For more on test series, [see this section.](http://bit.ly/2xDn38x)

### The generated command
Each selection from the previous steps will be used to generate a command which is used with the Mobile Center CLI to initiate a test run. For example, a command generated for an Android app with Espresso tests might look like:
```csharp
mobile-center test run espresso --app "mobile-center-username/app-name" --devices a32b320b --app-path pathToFile.apk  --test-series "master" --locale "en_US" --build-dir pathToEspressoBuildFolder
```

## Limitations
Please be aware that Mobile Center for Test cannot control any of the following:
 * Network throttling
 * Started the app in specific device orientation
 * VPN into corporate network instead of opening up ports to the firewall
 * Integration with other apps installed on the device

Mobile Centre for Test does not support the following hardware features:
 * Bluetooth
 * Throttling WiFi
 * Camera
 * Physically rotating the device
 * Simulating different battery conditions

## Test Cloud Security
Devices in Test Cloud are part of a shared public cloud, meaning that many users will install their app and run their tests on the same physical devices. While Test Cloud prohibits uploading personally identifiable information (PII), measures are taken to ensure security across test runs by different users. <br>
 * Any apps installed during a test run are uninstalled
 * All local storage is cleared from the device
 * Devices are restored to their default settings
  
  
  
  
  
  
  

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

Also note that Crash logs on iOS require Symbolication, please check out the [Mobile Center Crashes Symbols documentation](http://bit.ly/2xS1LUQ) that explains how to provide symbols for your app.

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
There are numerous use cases fpr this API, the most common one is people who call this API and implement their custom [MSCrashesDelegate](http://bit.ly/2go2JSo).

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
If you wish to manually integrate the module, follow this [documentation link](http://bit.ly/2gonTQs).

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
Make sure you have replaced ```{Your App Secret}``` in the code sample above with your App Secret. Please also check out the [Get started](http://bit.ly/2gww4ho) section if you haven't configured the SDK in your application.

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

You can easily provide your own resource strings if you'd like to localize the text displayed in the update dialog. Look at this [strings file](http://bit.ly/2gT9A75). Use the same string name/key and specify the localized value to be reflected in the dialog in your own app strings files.

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
1) Go to your Apple developer account and select your application from the [App ID](http://apple.co/2xSckqU) list in **Identifiers**.
2) Copy the **Prefix** value from this window and paste it to the Mobile Center push settings.
3) Do the same with the **ID** value.
  
#### Key ID
  1) In your Apple developer account [create a new key](http://apple.co/2goSk9m) in **Certificates, Identifiers & Profiles/Keys**.
  2) Make sure to check the APNs checkbox.
  3) Fill in the key name
  4) Press **Continue** then **Confirm**.
  5) On the next screen, copy the **Key ID** value and paste it to the Mobile Center push settings.
  6) Download the key file.

#### Push Token
  1) Open your key file with a text editor and copy the authentication token it contains.
  2) On the Mobile Center push settings, paste this token to the **Push Token** field then click **Done** to complete this configuration. For more information, refer to the [Apple documentation](http://apple.co/2yC1FVu).
  
#### [Optional] Enable silent notifications  
Silent notifications give you a way to wake up your app so that it can refresh its data in the background (see [Apple documentation](http://apple.co/2yA1wji). To enable silent notifications open Xcode's project editor, choose your target and click **Capabilities**. Turn on **Background Modes** and check the **Remote notifications** checkbox.

## Add Mobile Center Push to your app

### 1. Add the Mobile Center Push module

The Mobile Center SDK is designed with a modular approach – you only need to integrate the services that you're interested in.

#### Integration via Cocoapods
If you are integrating Mobile Center into your app via Cocoapods, add the following dependency to your podfile and run ```pod install```.
```swift
pod 'MobileCenter/Push'
```
#### Integration by copying the binaries into your project
If you wish to manually integrate the module, follow this [documentation link](http://bit.ly/2gvq60k).

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

Make sure you have replaced ```{Your App Secret}``` in the code sample above with your App Secret. Please also check out the [Get started section](http://bit.ly/2gww4ho) if you haven't configured the SDK in your application.

#### 2.3 [Optional] 
Receive push notifications if you have already implemented ```application:didReceiveRemoteNotification:fetchCompletionHandler``` method

If you or one of your third party libraries already implements ```application:didReceiveRemoteNotification:fetchCompletionHandler``` method, then follow step 4 to implement a callback to receive push notifications.

## Intercept push notifications
You can set up a delegate to be notified whenever a push notification is received in foreground or a background push notification has been tapped by the user. The delegate may also be woken up when a notification is received in background if you have enable [silent notifications](http://bit.ly/2yvRSAK) and if the payload of the notification contains the [content-available](http://bit.ly/2hQWlDC) flag set to true.

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
```swift
func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
  let result: Bool = MSPush.didReceiveRemoteNotification(userInfo)
  if result {
    completionHandler(.newData)
  }
  else {
    completionHandler(.noData)
  }
}
```
