# Abstract
This simple app has a Text Entry Box and a button that triggers the text to hit the [Azure Sentiment Analysis API](http://bit.ly/2i9jc13) and returns a corresponding Emoji and changes the background color appropriately.

# Index
* [Get Started with React Native](http://bit.ly/2yEab6n)
    * [Prerequisites](http://bit.ly/2zmG00D)
* [Build](http://bit.ly/2xSLkMY)
    * [React Native iOS Build](http://bit.ly/2xSBPNN)
    * [React Native Android Build](http://bit.ly/2xarPet)
* [Test](http://bit.ly/2zBRPkA)
    * [Getting Started with Test Cloud](http://bit.ly/2yzCXD9)
* [Distribute](http://bit.ly/2xabaYc)
    * [Getting Started with Distribute](http://bit.ly/2gwahpV)
* [Analytics](http://bit.ly/2zlVp1n)
    * [Custom Events](http://bit.ly/2x8O0Sd)
* [Crashes](http://bit.ly/2gSE210)
    * [Customize your usage of Mobile Center Crashes](http://bit.ly/2gSEzA2)
* [Push Notifications](http://bit.ly/2io7MXi)
    * [React Native Android Push](http://bit.ly/2x9yju0)
    * [React Native iOS Push](http://bit.ly/2gpCw5T)
    

# Get Started with React Native
The Mobile Center SDK uses a modular architecture so you can use any or all of the services.
<br>
<br>
Let's get started with setting up Mobile Center React Native SDK in your app to use Mobile Center Analytics and Mobile Center Crashes

## 1. Prerequisites
Before you begin, please make sure that the following prerequisites are met:
   * You are using a React Native project that runs React Native 0.34 or later.
   * You are targeting devices that are running on Android Version 4.0.3/API level 15 or later, or iOS version 8.0 or later.
   * The default way to use the SDK requires [Cocoapods](http://bit.ly/2l0WWrb). Nonetheless, it is possible to link the SDK manually.

## 2. Create your app in the Mobile Center Portal to obtain the App Secret
If you have already created your app in the Mobile Center portal, you can skip this step.
  1) Head over to [mobile.azure.com](http://bit.ly/2ygLNrH).
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
  1) The Mobile Center SDK uses a modular approach, where you just add the modules for Mobile Center services that you want to use. mobile-center-analytics and mobile-center-crashes make sense to add to almost every app, as they provide value with no additional setup required. mobile-center provides general purpose [Mobile Center APIs](http://bit.ly/2gpxA0Y), useful for multiple services.
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
The SDK will then ask whether or not to send user events automatically. [Learn more about sending user events manually](http://bit.ly/2yvd2io).
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
 We **strongly** recommend integrating the SDK via Cocoapodse as described above. Nonetheless, it's also possible to integrate the iOS native SDK manually.
 
  1) Download the [Mobile Center SDK for React Native frameworks](http://bit.ly/2gSn3fy) provided as a zip file.
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
Great, you are all set to visualize Analytics and Crashes data on the portal that the SDK collects automatically. There is no additional setup required. Look at [Analytics](http://bit.ly/2zlVp1n) and [Crashes](http://bit.ly/2gSE210) section for APIs guides and walkthroughs to learn what Mobile Center can do.



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

A successful build will produce an ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload a [provisioning profile (.mobileprovision) and a valid certificate (.p12)](http://bit.ly/2g8RjSF), along with the password for the certificate. The settings in your Xcode project need to be compatible with the files you are uploading. You can read more about [code signing here](http://bit.ly/2yJfJxj) and in the [Apple Developer official documentation](http://apple.co/2yV5Ts6).

#### 3.6. Launch your successful build on a real device

Use your newly produced IPA file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. [Read more about it here](http://bit.ly/2yk8SaG).

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
* if the build has been correctly signed, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. More details about code signing and distribution with Mobile Center can be [found here](http://bit.ly/2yJfJxj).
* if the build has not been signed, the .ipa can be signed by the developer (e.g. locally using codesign) or used for other purposes (e.g. upload to the Test service for UI testing on real devices or run in the simulator)
* All builds kicked off after May 17th are generated by [xcodebuild](http://bit.ly/2yzQ9bc). Unsigned builds will not produce an. ipa file. The artifact of an unsigned build is the .xcarchive file which can be used to generate an .ipa file with the Xcode Archives organizer.

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

[Yarn](http://bit.ly/2yASfJm) is a faster, more deterministic replacement for ```npm```. If a ```yarn.lock``` file is present in your repo next to ```package.json```, then Mobile Center will use Yarn, doing ```yarn install``` at the start of the build. Otherwise, it will do ```npm install```.


#### 5.2. Custom build scripts

In some scenarios you may want to run a script at the start of the build. For instance, if your React Native app uses TypeScript, then you'll want to run the ```tsc``` compiler at build start.
<br>
<br>
Mobile Center will have a [dedicated feature](http://bit.ly/2yDIRFi) for running custom scripts as part of a build. But for now you can achieve the same effect by creating a ```postinstall``` script in ```package.json```, adding a command like this:
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

Use your newly produced APK file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. [Read more about it here](http://bit.ly/2yk8SaG).

#### 3.6. Code signing

A successful build will produce an APK file. In order to release the build to the Play Store, it needs to be signed with a valid certificate stored in a keystore. To sign the builds produced from a branch, enable code signing in the configuration pane, upload your keystore to your repository, and provide the relevant values in the configuration pane. You can read more about [code signing here](http://bit.ly/2kN5bXD).

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

### 6. Build tips

#### 6.1. Yarn

[Yarn](https://yarnpkg.com/en/) is a faster, more deterministic replacement for ```npm```. If a ```yarn.lock``` file is present in your repo next to ```package.json```, then Mobile Center will use Yarn, doing ```yarn install``` at the start of the build. Otherwise, it will do ```npm install```.

#### 6.2. Custom build scripts

In some scenarios you may want to run a script at the start of the build. For instance, if your React Native app uses TypeScript, then you'll want to run the ```tsc``` compiler at build start.
<br>
<br>
Mobile Center will have a [dedicated feature](http://bit.ly/2yDIRFi) for running custom scripts as part of a build. But for now you can achieve the same effect by creating a ```postinstall``` script in package.json, adding a command like this:
```js
"scripts": {
    ...
    "postinstall" : "./postinstall.sh"     [other examples: "node ./postinstall.js" or just a single command like "tsc"]
  },
```

#### 6.3. Building multiple APKs
For React Native on Android, universal APK generation is disabled by default. If your app configuration is set up to build multiple APKs, e.g. different ones per CPU architecture or screen configuration, you need to make sure a universal APK is built as well. Our build system works with one main APK file and will ignore all APKs specific to a certain CPU/ABI or screen density. To learn more about APK splits and how to build a universal APK, please read the corresponding [Android developer guide](http://bit.ly/2ykaykj). In general, make sure that ```universalApk``` is set to ```true``` for your React Native build configuration.
<br>
<br>
Postinstall scripts run right after all the ```package.json``` packages are installed, so you use those packages in your script.


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











# Mobile Center Distribute
Mobile Center Distribution is a tool to for developers to release application binaries to their end user devices. The speed and integration capabilities make this tool perform admirably for release of pre-production or beta software to testing devices. Mobile Center Distribution supports the distribution of application packages for both iOS and Android.

## Getting Started with Distribute
Distributing with Mobile Center is easy, and only requires a few steps. No need for an SDK. Just the application binary.
  1) [Add users to your app](http://bit.ly/2l1IjE9) to grant access to all releases.
  2) Create [Distribution Groups](http://bit.ly/2gSLKZ8) to manage access.
  3) [Upload](http://bit.ly/2gTQ7TU) a new application release.
      * At the completion of the upload an email will be sent to all users of the app to notify them of the new release.
  4) [Install](http://bit.ly/2gTQ7TU) the release onto your device by clicking on the link in the email.
  5) [Enable In-App Updates](http://bit.ly/2gvXuUx) to help your users stay always on the latest release.

## Creating and managing apps

### Creating an app
To create an app, log in and click the **Add new** dropdown and choose **Add new app**.

### Accessing apps
All apps you belong to can be found in **My Apps**. When looking for apps owned by organizations you belong to, click on the organization in the left navigation.

### App roles
On each app there are three roles:
* **Managers** can manage app settings, collaborators, and integrations.
* **Developers** can manage app services (e.g. create builds, run tests).
* **Viewers** can view and download all data but cannot make changes.

To change the permission of a collaborator, select an app, click **Manage app** and use the dropdown to re-assign the role. Only 'Managers' can change collaborator permission

### Adding collaborators to apps
To share your app with others, select an app and then click **Manage app** to add collaborators by typing in the user's email address.

## Manage Distribution Groups
Distribution Groups are used to control access to releases. A Distribution Group represents a set of users that can be managed jointly and can have common access to releases. Example of Distribution Groups can be teams of users, like the QA Team or External Beta Testers or can represent stages or rings of releases, such as Staging.

### Creating a Distribution Group
To create a new Distribution Group select the "New Group" group button from the top of the screen. Provide a name for the Distribution Group. You can then add users to this group by email. You can also add additional users after the group has been created.

### Managing Users in a Distribution Group
Clicking on a Distribution Group will allow for management of the group. You can use the invitation box to add additional users. Or select users from the table to remove them from the group. From this page you can also see the full release history for this Distribution Group by clicking on the releases tab.

### Releasing a Build to a Distribution Group
To [release a new build](http://bit.ly/2yBFWes) to a Distribution Group. Make use of the "Distribute new Release" button at the top of the screen and choose the Distribution Group from the list during the steps.



## Release a Build
In order to distribute a release via Mobile Center, you must first upload your application binary package to Mobile Center. Mobile Center supports both .ipa and .apk package uploads for iOS and Android, respectively.

### Generating an application binary package
#### iOS
You will need to use the following steps to generate an IPA package for your application. For full details of this process please see the official [Apple documentation.](http://apple.co/2zo1VEN) <br>
 1) [Register UDIDs](http://bit.ly/2hR6kcd) for all hardware devices in your provisioning profile.
 2) Archive your application. In Xcode go to ```Product > Archive```
 3) Export the archive using the proper provisioning profile. Make sure to remember where the IPA file was placed on disk.

#### Android
For Android you will need to produce a properly signed apk file. For full details of this process please see the official [Google documentation.](http://bit.ly/2yViyvh) <br>
 1) Ensure you have [updated the manifest](http://bit.ly/2xTx8U7) and have a [properly configured Gradle build.](http://bit.ly/2ilzPqh)
Build the APK. From Android Studio select the build variant and then execute command ```Build > Build APK```

### Uploading the package
To upload a package to Mobile Center, use the navigation bar on the left to navigate to Distirbution. Then select "Distribute new release" button. Drag and drop or click to open a file dialog to upload your package. Optionally fill in some release notes. Select next and select a Distribution Group. This release will only be available to the users that have been added to that specific Distribution Group. Click next and review the release, then click distribute to release. On clicking the distribute button the release will be made available via Mobile Center and an email notification of the new version will be sent to all users of this application. Congrats, you have successful distributed a release via Mobile Center.

### Uploading using the APIs
 1) Pre-req: [Obtain an API token.](http://bit.ly/2gSRUIT) API Token is used for authentication for all Mobile Center API calls.
 2) Upload a new release. This is 3 or more API calls.
    a. Create an upload resource and get an ```upload_url``` (good for 24 hours) — [POST /createReleaseUpload](http://bit.ly/2gRKrd0)
    ```csharp
    curl -X POST --header 'Content-Type: application/json' --header 'Accept:
    application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APIExample/release_uploads'
    ```
    b. Upload to upload_url (will be a rink.hockeyapp.net URL). Use ```multipart/form-data``` where the ```key``` is ipa (key is always ipa even when uploading APKs)
    ```csharp
    curl -F "ipa=@Versions_1_1_0_12.ipa" https://rink.hockeyapp.net/api/sonoma/apps/cacf9867-87f7-4649-
    a400-632a775dde2d/app_versions/upload\?upload_id\=c18df340-069f-0135-3290-22000b559634
    ```
    c. After upload has finished, update upload resource's status to committed and get a ```release_url``` — [PATCH /updateReleaseUpload](http://bit.ly/2io8Eva)
    ```csharp
    curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header 
    'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d '{ "status": "committed" }'
    'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APITesting/release_uploads/c18df340-069f-0135-3290-22000b559634'
    ```
 3) Distribute the uploaded release to a distribution group — [PATCH /updateRelease](http://bit.ly/2yCJQUp)
 ```csharp
 curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header
 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d 
 '{ "destination_name": "QA Testers", "release_notes": "Example new release via the APIs" } 'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APITesting/releases/2'
 ```
 
 
 
 ## Install a Build
Installation of an application being distributed by Mobile Center begins with an email. If you have access to the application you will receive a notification email for each new version available. Simply click on the install link in the email to begin the process. You will need to enter your credentials to login. If this is your first time accessing Mobile Center, you can instead [create a new account](http://bit.ly/2yVphFJ). Once logged in you can review the application information and release notes, and click the install button to trigger installation onto your device.
<br>
<br>
On **iOS** you must open the email install link in Safari, only Safari supports the installation APIs.
<br>
<br>
On **Android** you must open the email install link in Chrome. On some devices, versions 57 and 58 of Chrome will not open the downloaded files (clicking the downloaded file will say "can't open file"). As a workaround, testers that hit this issue can use Chrome Canary instead. For more information about this bug see [Google Chrome Help Forum](http://bit.ly/2yuJlxZ).

### Windows and Certificates Requirements
To install a windows package requires a trusted root certificate installed in the root certificate chain for the device you are installing too. The most common solution is for the developer to sign a application package with a purchased 3rd party provider trusted root certificate. This certificate will chain to through the third party to the Microsoft root store and so will be a trusted cert for all user devices. Developers can opt to use a self-created test certificate and sign the application package, however it will result in additional steps for testers at installation time.

#### Installing a build signed with a developer test certificate
You can install a test signed app by first installing the test certificate (which is automatically included in the app package) by following these steps.
  1) Right-click on the .appxbundle package you downloaded via Mobile Center and select **properties**.
  2) Under the **Digital Signatures** tab you should see the test certificate. Click to select the certificate and click on **Details** button.
  3) Select the button **View Certificate**.
  4) Select the button **Install Certificate**.
  5) From the **Store Location** radio buttons select **Local Machine**. Click the ** Next** button.
  6) Click **Ye** on the admin prompt for changes to your device.
  7) On the **Certificate Import Wizard** chose the radio button **Place all certificates in the following store** then select the **Brows**e button.
  8) Select the **Trusted People certificate store**. Then click the **OK** button.
  9) Click the **Next button** on the **Certificate Import Wizard** window.
  10) Click **Finish** button to complete the certificate install.
  11) You can now close all windows and double click on the ```.appxbundle file```. It should now install properly.



## In-App Updates
Enable your tester to easily stay up to date with the latest releases. Integrate the Mobile Center SDK (and the Distribution Module) for [iOS](http://bit.ly/2hQofj3) and [Android](http://bit.ly/2gCC2Kr) to automatically enable in-app notification of new releases. Once completed all future releases through Mobile Center will trigger an in-app notification for each user allowing a quick upgrade to the latest version.















# Mobile Center Analytics
Mobile Center Analytics helps you understand user behavior and customer engagement to improve your app. The SDK automatically captures session count and device properties like model, OS version, etc. You can define your own custom events to measure things that matter to you. All the information captured is available in the Mobile Center portal for you to analyze the data.

Please follow the [Get started section](http://bit.ly/2yEab6n) if you haven't set up the SDK in your application yet.

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
Please follow the [Get started section](http://bit.ly/2yEab6n) if you haven't set up the SDK in your application yet.
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
 To use that feature you need to have answered **Processed in JavaScript by user** when executing ```react-native link``` for the Crash service configuration. This feature is thus dependent on [Processing crashes in JavaScript](http://bit.ly/2l3BqC8).
 
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
Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal. Mobile Center portal and the Push SDK is integrated with [Firebase Cloud Messaging](http://bit.ly/2ylZCEt).
<br>
<br>
Note that only devices having the [Google Play](http://bit.ly/2kNmQ1p) store application or emulators with **Google APIs** images can receive the notifications.

**Firebase displays a notification in the system notification center only if the application is in background at the moment the Push is received.**

## Prerequisite - Add Firebase to your app
Before using Mobile Center Push service, you need to add Firebase to your application. You can either choose a manual integration or Firebase Assistant.

### 1. Prerequisites
Please learn about [Prerequisites](http://bit.ly/2z6oEov), in particular please make sure to keep Google Repository up-to-date in the [Android SDK Manager](http://bit.ly/2xDNqQI).

### 2. Manual integration
  1) Follow the instructions listed in [Manually add Firebase](http://bit.ly/2ylgRGo) section.
  2) Make sure to continue following instructions in **Add the SDK** sub section right after but do not add ```compile "com.google.firebase:firebase-core:${version}"``` as the SDK manages this step for you can it could trigger incompatibilities if versions mismatch.
  
### Using Firebase Assistant
  1) Follow [these instructions](http://bit.ly/2gak4hQ) if you don't see ```Firebase``` in the ```Tools``` menu.
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
Please follow the [Get started section](http://bit.ly/2yEab6n) if you haven't set up the SDK in your application yet.
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

## React Native iOS Push
Mobile Center Push enables you to send push notifications to users of your app from the Mobile Center portal.

### Prerequisite - Enable Apple Push Notifications service (APNs) for your app
Configure Apple Push Notifications service (APNs) for your app from your Apple developer account and Mobile Center portal before adding Mobile Center Push to your app.

#### Enable push notifications on your application
In Xcode's project editor, choose your target and click **Capabilities**. In the **Push Notifications** section, click the switch to turn it from OFF to ON.

#### Set up APNs

Log in to the Mobile Center portal, select your application, click on the **Push** button from the left menu then click **Next** to reveal the push notification settings UI.
<br>
<br>
On the bottom of the page, select Sandbox for initial development or Production for production version of your application.
<br>
<br>
Collect the following information:
   **1) Prefix and ID**
* Go to your Apple developer account and select your application from the App ID list in Identifie               
* Copy the Prefix value from this window and paste it to the Mobile Center push settings.
* Do the same with the ID value.
   
   **2) Key ID**
* In your Apple developer account create a new key in Certificates, Identifiers & Profiles/Keys.
* Make sure to check the APNs checkbox.
* Fill in the key name
* Press Continue then Confirm.
* On the next screen, copy the Key ID value and paste it to the Mobile Center push settings.
* Download the key file.

  **3) Push Token**
* Open your key file with a text editor and copy the authentication token it contains.
* On the Mobile Center push settings, paste this token to the **Push Token** field then click **Done** to complete this configuration. For more information, refer to the [Apple documentation](http://apple.co/2yC1FVu).

#### [Optional] Enable silent notifications
Silent notifications give you a way to wake up your app so that it can refresh its data in the background (see [Apple documentation](http://apple.co/2yA1wji. To enable silent notifications open Xcode's project editor, choose your target and click **Capabilities**. Turn on **Background Modes** and check the **Remote notifications** checkbox.
 
## Add Mobile Center Push to your app

### 1) Add the Mobile Center Push module

Please follow the [Get started section](http://bit.ly/2yEab6n) if you haven't set up the SDK in your application yet.
<br>
<br>
The Mobile Center SDK is designed with a **modular approach** – you only need to integrate the services that you're interested in.

#### Integrate the SDK automatically
The default integration of the SDK uses Cocoapods for iOS.
   1) Open a Terminal and navigate to the root of your React Native project, then enter the following to add Mobile Center Push to the app:
   ```js
   npm install mobile-center-push --save
   ```
   2) Link the plugin to the React Native app by using the ```react-native link``` command.
   ```js
   react-native link mobile-center-push
   ```
#### Integrate the iOS SDK manually
If you wish to manually integrate the module, follow the manual integration steps at [documentation link](http://bit.ly/2xRNhEu).

### 2.Start Mobile Center Push

#### 2.1 Register for notifications
Mobile Center Push is started by this call:
```swift
#import <RNPush/RNPush.h>

...q

[RNPush register];
```
That call is added automatically to **AppDelegate.m** by the automatic instructions above. Otherwise, you need to add it manually.
<br>
<br>
Note that when the app calls ```register``` for the first time after being installed, iOS will prompt the user for permission to receive push notifications. If you wish to delay when that permission prompt appears to the user, say until after an app first time use wizard finishes, delay making the ```register``` call.

#### 2.2 [Optional] Receive push notifications if you have already implemented ```application:didReceiveRemoteNotification:fetchCompletionHandler``` method

If you or one of your third party libraries already implements application:didReceiveRemoteNotification:fetchCompletionHandler method, then follow step 4 to implement a callback to receive push notifications.

## Intercept push notifications
You can set up a listener to be notified whenever a push notification is received in foreground or a background push notification has been tapped by the user. The listener may also be woken up when a notification is received in background if you have enable [silent notifications](http://bit.ly/2yCNFuK) and if the payload of the notification contains the [content-available](http://bit.ly/2hQWlDC) flag set to true.
<br>
<br>
If silent notifications are enabled and you push a notification with ```content-available```: 1, then the listener may be triggered twice for the same notification: when the notification is received in background and when it is tapped.
By default, iOS does not generate notifications when the push is received in foreground, you can use the listener to customize the push experience when received in foreground or do a specific action when the application is launched by clicking on the push notification when received in background.
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

## Enable or disable Mobile Center Push at runtime
You can enable and disable Mobile Center Push at runtime. If you disable it, the SDK will stop updating the device token used to push but the existing one will continue working. In other words, disabling the Mobile Center Push in the SDK will **NOT** stop your application from receiving push notifications.
```js
import Push from 'mobile-center-push';

...

await Push.setEnabled(false);      // Disable push
await Push.setEnabled(true);       // Re-enable it
```

## Check if Mobile Center Push is enabled
You can also check if Mobile Center Push is enabled or not:
```js
import Push from 'mobile-center-push';

...

const pushEnabled = await Push.isEnabled();
```

## Disable automatic forwarding of application delegate's methods to Mobile Center services
Mobile Center uses swizzling to automatically forward your application delegate's methods to Mobile Center services to improve SDK integration. There is a possibility of conflicts with other third party libraries or the application delegate itself. In this case, you might want to disable the Mobile Center application delegate forwarding for all Mobile Center services by following the steps below:
   1) Open your ```Info.plist``` file.
   2) Add ```MobileCenterAppDelegateForwarderEnabled``` key and set the value to ```0```. This will disable application delegate forwarding for all Mobile Center services.
   3) Implement the callbacks to register push notifications
Implement the ```application:didRegisterForRemoteNotificationsWithDeviceToken```: callback and the ```application:didFailToRegisterForRemoteNotificationsWithError```: callback in your ```AppDelegate``` to register for Push notifications. 
```swift
- (void)application:(UIApplication *)application
    didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {

  // Pass the device token to MSPush.
  [MSPush didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application
    didFailToRegisterForRemoteNotificationsWithError:(nonnull NSError *)error {

  // Pass the error to MSPush.
  [MSPush didFailToRegisterForRemoteNotificationsWithError:error];
}
```
   4) Implement the callback to receive push notifications
   Implement the ```application:didReceiveRemoteNotification:fetchCompletionHandler``` callback to add the logic for receiving a Push notification.
   ```swift
   - (void)application:(UIApplication *)application
   didReceiveRemoteNotification:(NSDictionary *)userInfo
         fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
  NSDictionary *dictionary = [[userInfo objectForKey:@"aps"] objectForKey:@"alert"];
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[dictionary valueForKey:@"title"]
                                                  message:[dictionary valueForKey:@"body"]
                                                 delegate:self
                                        cancelButtonTitle:@"OK"
                                        otherButtonTitles:nil];
  [alert show];
}
```



























