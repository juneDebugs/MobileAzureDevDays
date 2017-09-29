# Mobile Center Build 

Mobile Center helps you build the mobile apps you and your team is working on, using a secure infrastructure. You can forget about configuring build servers locally, complicated configurations and code that is working on a co-worker's machine, but not working on yours. 
<br>
To get started, a member of the app in Mobile Center needs to connect to their source control and select the repository where the app is located and then start building your app with only a few clicks.
Currently, you can build apps hosted on Git repositories in GitHub, Bitbucket and Visual Studio Team Services (VSTS).
While in public preview, we are constantly adding features and further platform support. If you are developing a mobile app in a platform that is not supported, chances are our team is working on it. Don't hesitate to contact us and let us know more about your needs

## Xamarin.iOS Build

To start building a Xamarin iOS app, first of all, you need to connect to your repository service (GitHub, Bitbucket, VSTS) account,
select a repository and a branch where your app lives and then you can set up your first build. Choose the solution file and 
the configuration that you would like to build; for the app to run on a real device, the build needs to be code signed 
with a valid provisioning profile and a certificate.

## 1. Linking your repository
If you haven't done it previously already, first of all, you have to connect your repository service (GitHub, Bitbucket, VSTS) account. Once your account is connected, select the repository where your iOS project is located. In order to setup a build for a repository, you need admin and pull rights for it.

## 2. Selecting a branch
Next step once you have selected a repository is to select the branch you want to build. By default all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build

## 3. Setting up your first build
To kick off the first build, configure how the iOS project should get built.

**3.1. Project/solution** <br>
  * Mobile Center automatically detects the solution and project files in your repository. Select the **.sln** or  **.csproj/.fsproj** you would like to build.

###### 3.1.1. Building from the solution file (.sln)
  * In your code make sure to disable Android and UWP projects for build configs that are intended for iOS builds: go into the   solution's configuration mappings, and for all mappings that target **iPhone** and **iPhoneSimulator**, uncheck all the       projects which are targeting other platforms. This will ensure that when the **.sln** is building, it will not attempt to     build the other projects. There is more solution configurations mapping information you can read.

###### 3.1.2. Building from the project file (.csproj/.fsproj)
  * In order to build from a **.csproj/.fsproj** file all the referenced projects (e.g. your PCL project) must contain the configuration with the same name as the one from your source iOS project. So, if you run the **Debug** configuration for the simulator in Mobile Center, your PCL project must have the **Debug|iPhoneSimulator** configuration. In case they don't exist and to prevent further errors we add such configurations before building your projects. Those configurations have basic 
default settings for Debug and Release only.

**3.2. Configuration** <br>
  * Select the configuration you would like to build with. The configurations are automatically detected depending on the source file picked in the previous step.

**3.3. Mono version** <br>
  * Mobile Center allows using different Mono environments for your build to maintain backward compatibility while releasing a support for new features. The default Mono version for a new branch configuration will be the latest one. You may choose to use one of the previous Mono environments to build older versions of frameworks or libraries.

**3.4. Xcode Version** <br>
  * Current version of Xamarin requires **Xcode 8.0 or higher**.

**3.5. Build triggers** <br>
  * By default a new build is triggered on every push a developer does to the configured branch. This is often referred to as **"Continuous Integration"**. If you prefer to manually trigger a new build, you can change this setting in the configuration pane.

**3.6. Simulator build** <br>
  * Simulator builds can only be ran on simulators and cannot be installed on the device, however the builds complete faster then device builds. If your build is not a simulator build, you need to upload code signing files in the next step.

**3.7. Increment build number** <br>
  * When enabled, the ```CFBundleVersion``` in the Info.plist of your app automatically increments for each build. The change happens pre build and won't be committed to your repository.

**3.8. Code signing** <br>
  * A successful device build will produce an ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload [a provisioning profile (.mobileprovision) and a valid certificate (.p12)](https://docs.microsoft.com/en-us/mobile-center/build/ios/code-signing/uploading-files), along with the password for the certificate. You can read more about code signing and device provisioning of Xamarin iOS apps in the [Xamarin official documentation](https://developer.xamarin.com/guides/ios/getting_started/installation/device_provisioning/).

**3.9. Launch your successful build on a real device** <br>
  * Use your newly produced IPA file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. You may want to check more [comprehensive guide about testing your builds](https://docs.microsoft.com/en-us/mobile-center/build/build-test-integration).

**3.10. NuGet restore** <br>
  * If the NuGet.config file is checked-in into the repository and sitting next to the .sln or at the root, Mobile Center will auto-restore the NuGet feed. To restore private NuGet feeds, make sure you include the credentials in the NuGet.config file:
```
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="nuget" value="https://api.nuget.org/v2/index.json" />
    <add key="MyGet" value="https://www.myget.org/F/MyUsername/api/v2/index.json" />
    <add key="MyAuthNuget" value="https://nuget.example.com/v2/index.json" />
  </packageSources>
  <activePackageSource>
    <add key="All" value="(Aggregate source)" />
  </activePackageSource>
  <packageSourceCredentials>
    <MyAuthNuget>
      <add key="Username" value="myusername" />
      <add key="ClearTextPassword" value="password" />
    </MyAuthNuget>
  </packageSourceCredentials>
</configuration> 
```
**3.11. Distribution to a distribution group** <br>
  * You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app. <br>
Once you save the configuration, a new build will be automatically kicked off.

## 4. Build results
After a build has been triggered, it can be in the following states:
 * **queued** - the build is in a queue waiting for resources to be freed up
 * **building** - the build is running and performing the predefined tasks
 * **succeeded** - the build is completed and it has succeeded
 * **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
 * **canceled**- the build has been canceled by a user action or it has timed out

**4.1. Build logs** <br>
 * For a completed build (succeeded or failed), download the logs to understand more about how the build went. Mobile Center provides an archive with the following files:
 ```
    |-- 1_build.txt (this is the general build log)
    |-- build (this folder contains a separate log file for each build step)
       |-- <build-step-1> (e.g. 2_Get Sources.txt)
       |-- <build-step-2> (e.g. 3_Pod install.txt)
       |--
       |-- <build-step-n> (e.g. n_Post Job Cleanup.txt) 
```  
The build step specific logs (located in the ```build/``` directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.

**4.2. The app (.ipa or .app)** <br>
 * The .ipa is an iPhone application archive file which stores the iOS app. If the build has been correctly signed, the .ipa can be installed on a real device, corresponding to the provisioning profile used when signing. There are more [details about code signing and distribution with Mobile Center.](https://docs.microsoft.com/en-us/mobile-center/build/ios/code-signing/index) <br>
If this is a simulator build, you can run the .app file on a simulator, but you cannot use it on a real device.

**4.3. The symbol files (.dsym)** <br>
* Symbol files are only generated for device builds. The .dsym files contains the debug symbols for the app.
     1) If you have previously integrated the Mobile Center SDK in your app with the crash reporting module enabled, the crash reporting        beacon requires this .dsym file for a build in order to display human readable (symbolicated) crash reports
     2) if you have previously integrated another SDK for crash reporting purposes in your app (e.g. HockeyApp SDK), the corresponding          service requires the .dsym file in order to display human readable (symbolicated) crash reports


## Xamarin.Android Build

To start building an app, first of all, you need to connect to your repository service (GitHub, Bitbucket, VSTS) account, select a repository and a branch where your app lives and then you can set up your first build. Choose the Android project that you would like to build; for the app to run on a real device, the build needs to be code signed with a valid KeyStore.

## 1. Linking your repository
If you haven't done it previously already, first of all, you have to connect your repository service (GitHub, Bitbucket, VSTS) account. Once your account is connected, select the repository where your Android project is located. In order to setup a build for a repository, you need admin and pull rights for it.

## 2. Selecting a branch
The next step once you have selected a repository is to select the branch you want to build. By default, all the active branches will be listed. Upon selecting the branch you want to get started with, it is time to setup your first build!

## 3. Configuring Your Build
To kick off the first build, configure how the Android project should get built.

**3.1. Build triggers** <br>
 * By default, a new build is triggered on every push a developer does to the configured branch. This is often referred to as “Continuous Integration”. If you prefer to manually trigger a new build, you can change this setting in the configuration pane.

**3.2. Project and Configuration** <br>
 * The available projects in your repository will populate. Select the correct project for your Android build and select the appropriate configuration.
 
**3.3. Mono version** <br>
 * Mobile Center **allows using different Mono environments** for your build to maintain **backward compatibility** while releasing a support for new features. The default Mono version for a new branch configuration will be the latest one. You may choose to use one of the previous Mono environments to build older versions of frameworks or libraries.
 
 **3.4. Increment version number** <br>
  * When enabled, the version code in the AndroidManifest.xml of your app automatically increments for each build. The change happens pre build and won't be committed to your repository.
 
 **3.5. Code signing** <br>
  * A successful build will produce an apk file. In order to release the build to the Play Store, it needs to be signed with a valid Keystore and Alias. To sign the builds produced from a branch, enable code signing in the configuration pane, upload your Keystore, and provide the values needed in the configuration pane. You can read more [detailed code signing instructions.](https://docs.microsoft.com/en-us/mobile-center/build/android/code-signing/xamarin)

**3.6. Launch your successful build on a real device** <br>
 * Use your newly produced APK file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. There is more [specific test integration information.]("https://docs.microsoft.com/en-us/mobile-center/build/build-test-integration")
 
**3.7. NuGet restore** <br>
 * If the **NuGet.config file** is checked-in into the repository and sitting next to the ```.sln``` or at the root, Mobile Center will auto-restore the NuGet feed. To restore private NuGet feeds, make sure you include the credentials in the **NuGet.config file**:
 ```
 <?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="nuget" value="https://api.nuget.org/v2/index.json" />
    <add key="MyGet" value="https://www.myget.org/F/MyUsername/api/v2/index.json" />
    <add key="MyAuthNuget" value="https://nuget.example.com/v2/index.json" />
  </packageSources>
  <activePackageSource>
    <add key="All" value="(Aggregate source)" />
  </activePackageSource>
  <packageSourceCredentials>
    <MyAuthNuget>
      <add key="Username" value="myusername" />
      <add key="ClearTextPassword" value="password" />
    </MyAuthNuget>
  </packageSourceCredentials>
</configuration>
 ```
 **3.8. Distribution to a distribution group** <br>
You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app. <br>
Once you save the configuration, a new build will be kicked off automatically.

## 4. Build results
After a build has been triggered, it can be in the following states: <br>
 * **queued** - the build is in a queue waiting for resources to be freed up
 * **building** - the build is running and performing the predefined tasks
 * **succeeded** - the build is completed and it has succeeded
 * **failed** - the build has completed but it has failed; you can troubleshoot what went wrong by downloading and inspecting the build log
 * **canceled** - the build has been canceled by a user action or it has timed out
 
 **4.1. Build logs** <br>
 * For a completed build (succeeded or failed), download the logs to understand more about how the build went. Mobile Center provides an archive with the following files:
 ```
|-- 1_build.txt (this is the general build log)
|-- build (this folder contains a separate log file for each build step)
    |-- <build-step-1>
    |-- <build-step-2>
    |--
    |-- <build-step-n> (e.g. n_Post Job Cleanup.txt 
 ```
 * The build step specific logs (located in the build/ directory of the archive) are helpful for troubleshooting and understanding in what step and why the build failed.
 
 **4.2. The app (.apk)**<br>
The APK is an Android application packaged file which stores the Android app. If the build has been correctly signed, the APK can be installed on a real device and deployed to the Play Store. If the build has not been signed, the APK can be run on an emulator or used for other purposes.


# Mobile Center Test

## Getting Started with Test Cloud
The prerequisite steps below must be completed before a project can be used with Mobile Center Test Cloud.
  1. Create a Mobile Center account
Create a Mobile Center account at [mobile.azure.com](https://mobile.azure.com/login?original_url=%2F) to gain access to Test Cloud.
  2. Install the Mobile Center CLI
Test runs are executed using the Mobile Center CLI. If not already installed, follow [these instructions](https://docs.microsoft.com/en-us/mobile-center/cli/index) to install. After installation, run mobile-center login to link a Mobile Center account with the tool.
  3. Create an app in Mobile Center
All test assets and operations are within the context of an app. Create the app project to be tested.
  4. Review the core concepts
Understanding the core concepts of the Test Cloud experience improve ease of use, navigation, and communications with support. It is recommended to become familiar with [these concepts](https://docs.microsoft.com/en-us/mobile-center/test-cloud/core-concepts) before running your first tests.
  5. Prepare the project for upload
Each test framework has different requirements for uploading to Test Cloud. Follow the appropriate test framework branch from [this page.](https://docs.microsoft.com/en-us/mobile-center/test-cloud/preparing-for-upload/index)

## Preparing Xamarin.UITests for Upload
After UITests have been written for a Xamarin app, the app and tests may be uploaded to Mobile Centre for extensive testing on real devices. This section provides details on preparing a Xamarin mobile application before submitting Xamarin.UITests for Xamarin mobile apps to Mobile Center for Test. <br>
Before submitting a test, it is necessary to [create an app](https://docs.microsoft.com/en-us/mobile-center/dashboard/creating-and-managing-apps) at [Mobile Center](https://mobile.azure.com/login?original_url=%2F), and then to create a **test run** using the Test Run wizard that is available under the Test service. <br>
When the Test Run Wizard is finished, it will provide a sample command line that can be used to submit the app and UITests to Mobile Center for Test. These two snippets are examples of a command line generated by the Test Run wizard:<br>

For a Xamarin.Android application, the Test Run wizard will create a command line similar to this snippet:
```
mobile-center test run uitest --app "<APP NAME>" --devices "<DEVICE SET NAME>" --app-path <PATH_TO_APK> --test-series "<TEST SERIES>" --locale "en_US" --build-dir <PATH TO UITEST BUILD DIRECTORY>
```
For Xamarin.iOS, the Test Run wizard will create a command line that resembles the following snippet:
```
mobile-center test run uitest --app "<APP NAME>" --devices <DEVICE SET ID> --app-path <PATH TO IPA> --test-series "<TEST SERIES>" --locale "en_US" --build-dir <PATH TO UITEST BUILD DIRECTORY>
```
The command line parameters include the following pieces of information that is specific to the rest run that was created:<br>
 * **APP NAME** – The name of the app that was created in Mobile Center.
 * **PATH TO APK / IPA** – This is the path to the app to be tested.
 * **DEVICE SET NAME / ID** – This is a value that represents the device set to run the apps on. A device set is a collection of devices and operating systems.
 * **TEST SERIES** – This is a label that is used to group a series of related test runs together. By default, the value of the test series is master.
 * **PATH TO UITEST BUILD DIRECTORY** – The path to the directory that holds the UITest assembly.

After the test run has been created, ensure that the following software is installed on the computer that will submit the tests:
 1) Ensure that the computer has [Node.js 6.3](https://nodejs.org/en/) installed.
 2) Install the [Mobile Center CLI.](https://docs.microsoft.com/en-us/mobile-center/cli/index) Instructions for installing the Mobile Center CLI maybe be found in the [README.md on Github.](https://github.com/Microsoft/mobile-center-cli)

## Preparing Xamarin.Android Apps
The two steps detail what is necessary to prepare a Xamarin.Android app and UITest for submission to Mobile Centre for Test:
 1) Ensure that the app requests the ```INTERNET``` permission.
 2) Disable the **Shared Mono Runtime**. The Shared Mono Runtime will prevent UITests from running in Mobile Center for Test.
On Visual Studio 2017, open the project properties, and select the ```Android Options tab```. The first section, ```Packaging Properties``` will have a checkbox for the ```Shared Mono Runtime```.
On Visual Studio for Mac, look in the ```Project Options```, under ```Build > Android Build```. The ```Packaging and Deployment``` section of the ```General``` tab will have a checkbox for the ```Shared Mono Runtime```.

## Preparing Xamarin.iOS Apps
Xamarin.iOS apps must have the Xamarin Test Cloud Agent linked into the IPA. If necessary, see the guide [Adding Xamarin.UITests to a Solution](https://developer.xamarin.com/guides/testcloud/uitest/adding-uitest/#Adding_the_Xamarin_Test_Cloud_Agent_to_the_iOS_Project) on the Xamarin website for details to how to add the Xamarin Test Cloud Agent to a Xamarin.iOS application.

## Starting a Test Run
This section provides instructions for initiating a test run with test suites that have been prepared for upload. To learn how to prepare a test suite for upload to Test Cloud, see [preparing tests for upload.](https://docs.microsoft.com/en-us/mobile-center/test-cloud/preparing-for-upload/index) <br>

Initiating a test run in Test Cloud requires the [Mobile Center CLI tool.](https://docs.microsoft.com/en-us/mobile-center/cli/index) <br>

With the Mobile Center CLI tool installed and upload preparation complete, initiating a test run is very straightforward as the UI will guide you through the necessary steps. Begin by navigating to the Test Cloud section within the desired app. Clicking the ```new test run``` button will launch a dialog which will lead you through the 3 steps of preparing a test run.

**Device selection** <br>
Select the devices against which this test run should execute. This collection of devices can optionally be saved as a set for future use. To save the set, follow the on-screen prompts.

**Test run configuration** <br>
Select the test framework, set the device locale, and select a test series. Device locale will determine the system-level device settings, such as language. For more on test series, [see this section.](https://docs.microsoft.com/en-us/mobile-center/test-cloud/core-concepts)

**The generated command** <br>
Each selection from the previous steps will be used to generate a command which is used with the Mobile Center CLI to initiate a test run. For example, a command generated for an Android app with Espresso tests might look like:
```
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

# Distribution with Mobile Center
Mobile Center Distribution is a tool to for developers to release application binaries to their end user devices. The speed and integration capabilities make this tool perform admirably for release of pre-production or beta software to testing devices. Mobile Center Distribution supports the distribution of application packages for both iOS and Android.

## Getting Started
Distributing with Mobile Center is easy, and only requires a few steps. No need for an SDK. Just the application binary. <br>
 1) [Add users to your app](https://docs.microsoft.com/en-us/mobile-center/dashboard/creating-and-managing-apps) to grant access to all releases.
 2) [Create Distribution Groups](https://docs.microsoft.com/en-us/mobile-center/distribution/groups)to manage access.
 3) [Upload](https://docs.microsoft.com/en-us/mobile-center/distribution/uploading) a new application release.
    * At the completion of the upload an email will be sent to all users of the app to notify them of the new release.
 4) [Install](https://docs.microsoft.com/en-us/mobile-center/distribution/installation) the release onto your device by clicking on the link in the email.
 5) Enable [In-App Updates](https://docs.microsoft.com/en-us/mobile-center/distribution/inappupdates) to help your users stay always on the latest release.
 
 ## Release a Build
 In order to distribute a release via Mobile Center, you must first upload your application binary package to Mobile Center. Mobile Center supports both .ipa and .apk package uploads for iOS and Android, respectively.
 
 **iOS** <br>
You will need to use the following steps to generate an IPA package for your application. For full details of this process please see the official [Apple documentation.](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/TestingYouriOSApp/TestingYouriOSApp.html#//apple_ref/doc/uid/TP40012582-CH8-SW1) <br>
 1) [Register UDIDs](https://docs.microsoft.com/en-us/mobile-center/distribution/auto-provisioning) for all hardware devices in your provisioning profile.
 2) Archive your application. In Xcode go to ```Product > Archive```
 3) Export the archive using the proper provisioning profile. Make sure to remember where the IPA file was placed on disk.

**Android** <br>
For Android you will need to produce a properly signed apk file. For full details of this process please see the official [Google documentation.](https://developer.android.com/studio/publish/preparing.html) <br>
 1) Ensure you have [updated the manifest](https://developer.android.com/guide/topics/manifest/manifest-intro.html) and have a [properly configured Gradle build.](https://developer.android.com/studio/build/build-variants.html)
Build the APK. From Android Studio select the build variant and then execute command ```Build > Build APK```

## Uploading the package
To upload a package to Mobile Center, use the navigation bar on the left to navigate to Distirbution. Then select "Distribute new release" button. Drag and drop or click to open a file dialog to upload your package. Optionally fill in some release notes. Select next and select a Distribution Group. This release will only be available to the users that have been added to that specific Distribution Group. Click next and review the release, then click distribute to release. On clicking the distribute button the release will be made available via Mobile Center and an email notification of the new version will be sent to all users of this application. Congrats, you have successful distributed a release via Mobile Center.

**Uploading using the APIs** <br>
 1) Pre-req: [Obtain an API token.](https://docs.microsoft.com/en-us/mobile-center/api-docs/) API Token is used for authentication for all Mobile Center API calls.
 2) Upload a new release. This is 3 or more API calls.
    a. Create an upload resource and get an ```upload_url``` (good for 24 hours) — [POST /createReleaseUpload](https://docs.mobile.azure.com/api/#!/distribute/createReleaseUpload)
    ```
    curl -X POST --header 'Content-Type: application/json' --header 'Accept:
    application/json' --header 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
    'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APIExample/release_uploads'
    ```
    b. Upload to upload_url (will be a rink.hockeyapp.net URL). Use ```multipart/form-data``` where the ```key``` is ipa (key is always ipa even when uploading APKs)
    ```
    curl -F "ipa=@Versions_1_1_0_12.ipa" https://rink.hockeyapp.net/api/sonoma/apps/cacf9867-87f7-4649-
    a400-632a775dde2d/app_versions/upload\?upload_id\=c18df340-069f-0135-3290-22000b559634
    ```
    c. After upload has finished, update upload resource's status to committed and get a ```release_url``` — [PATCH /updateReleaseUpload](https://docs.mobile.azure.com/api/#/distribute/updateReleaseUpload)
    ```
    curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header 
    'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d '{ "status": "committed" }'
    'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APITesting/release_uploads/c18df340-069f-0135-3290-22000b559634'
    ```
 3) Distribute the uploaded release to a distribution group — [PATCH /updateRelease](https://docs.mobile.azure.com/api/#!/distribute/updateRelease)
 ```
 curl -X PATCH --header 'Content-Type: application/json' --header 'Accept: application/json' --header
 'X-API-Token: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' -d 
 '{ "destination_name": "QA Testers", "release_notes": "Example new release via the APIs" } 'https://api.mobile.azure.com/v0.1/apps/JoshuaWeber/APITesting/releases/2'
 ```
 ## Device registration
 As a prerequisite for distributing your app to iOS devices, it is necessary to obtain the correct device ID and register it in the Apple developer portal. To help you with releasing apps to internal testers, Mobile Center contains a tool for registering device IDs in Apple's developer portal. On top of that, Mobile Center updates the provisioning profile used for distribution with the new IDs.
 
## How to get started
To initiate the device registration flow, select a distribution group with unprovisioned devices and navigate to the devices tab. Click the ```Devices tab``` and click the ```Register devices``` button. A dialog will prompt for your username and password used in the [Apple developer portal.](https://developer.apple.com/) Once you log in with your Apple username and password, Mobile Center will add the unprovisioned devices to both your Apple developer account and the corresponding provisioning profile. It is possible to download the updated provisioning profile with the button on the review screen. Alternatively, the profile is available to download through Xcode or the Apple developer portal.

## Privacy concerns on username and password
Mobile Center only uses your Apple ID once as a one-time transaction, and it does not store or in any other way have access to your username and password.

## What is happening when you click register devices
Mobile Center registers device IDs in your Apple developer account and adds them to the provisioning profile used for distribution. An Apple Developer account has a finite number of spots for devices split by device type. Apple works with five device types, which are iPad, iPhone, iPod, Apple TV, and Apple Watches. Each of these has a limitation of 100 devices i.e. if you register six devices all of which is iPhones, you have 94 devices IDs left for iPhones and still have 100 left for each of the four other device types. You can read more about it in [Apple's documentation.](https://developer.apple.com/library/content/documentation/IDEs/Conceptual/AppDistributionGuide/MaintainingProfiles/MaintainingProfiles.html#//apple_ref/doc/uid/TP40012582-CH30-SW10)

## Next step for this feature
The Mobile Center roadmap includes a solution to automatically register device IDs with Apple developer portal, then apply it to your app so testers can install it within minutes.

## Privacy concerns on username and password
Mobile Center only uses your Apple ID once as a one-time transaction, and it does not store or in any other way have access to your username and password
 
# Mobile Center Crash
Mobile Center Crash Reporting lets developers collect crashes in their apps whether they occur in testing or in production.

## iOS Crashes
**Getting Started** <br>
 1) Integrate the SDK as described in the [Getting Started with iOS documentation.](https://docs.microsoft.com/en-us/mobile-center/sdk/getting-started/ios)
 2) Upload the symbols that are created with each build using the Incoming page under the app.
 3) Add a test crash to the app's code by calling the ```generateTestCrash``` method of the crash reporting module as an action to a button.
 4) Run the app without the debugger connected, crash it and restart it.
 5) After a few minutes the crash report should be visible in the UI.
 
**Uploading symbols** <br>
 1) Create a ZIP file for the dSYM package on your Mac.
 2) Open the **Incoming page** under **Crash Reporting** on Mobile Center of the app.
 3) Upload the zip file.
 4) After the zip file is indexed by Mobile Center new incoming crashes will be symbolicated.
 
 **Troubleshooting** <br>
 1) Why are crash reports not visible after a few minutes?
    * Right now crash reports are only visible if they can be symbolicated. For that to happen the proper symbols (dSYM) need       to be uploaded. There will be a UI available later that shows which symbols are missing and how to find them.
 2) What could be another reason for the crash report to not appear?
    * Make sure the app doesn't crash on startup, as the SDK wouldn't have time to send the crash report. This is a limitation       for any 3rd party crash reporting service.
 3) The symbols are uploaded but the previous crash reports are not appearing.
    * As of now only new incoming crashes will be symbolicated. Processing pending crashes is on our roadmap.
 
## Android Crashes
**Getting Started** <br>
 1) Integrate the SDK as described in the [Getting Started with Android documentation.](https://docs.microsoft.com/en-us/mobile-center/sdk/getting-started/android)
 2) Add a test crash to the apps code by calling the ```Crashes.generateTestCrash()``` method of the crash reporting module as an action to a buttone
 3) Run the app without the debugger connected, crash it and restart it
 4) After a few minutes the crash report should be visible in the UI
 
**Troubleshooting** <br>
 1) Why are crash reports not visible after a few minutes?
    * Make sure the app doesn't crash on startup, as the SDK wouldn't have time to send the crash report. This is a limitation     for any 3rd party crash reporting service which is not possible to overcome.
 2) How can I see de-obfuscated stack traces?
    * This is currently not supported but on our roadmap.
 3) Do you have an Android NDK?
    * This is currently not available but on our roadmap.
 
 # Mobile Center Analytics 
 Let's get started with setting up Mobile Center Xamarin SDK in your app to use Mobile Center Analytics and Mobile Center Crashes. To add Mobile Center Distribute to you app, please have a look at the [documentation for Mobile Center Distribute.](https://docs.microsoft.com/en-us/mobile-center/sdk/distribute/xamarin)
 
## 1. Prerequisites
Before you begin, please make sure that the following prerequisites are met:
 * Your project is set up in Xamarin Studio or Xamarin for Visual Studio.
 * You are targeting devices running iOS 8.0 or later or Android 4.0.3 (API level 15) or later
 * You are not using any other SDK that provides Crash Reporting functionality.
The Mobile Center SDK for Xamarin supports the following platforms:
 * Xamarin.Android
 * Xamarin.iOS
 * Xamarin.Forms (iOS, Android and UWP)
 
##### 1.1 About Xamarin.Android
Choose this option if you target no other platform but Android. You need to create one app in the Mobile Center portal with the **Android** as the OS and **Xamarin** as the platform.

##### 1.2 About Xamarin.iOS
Choose this option if you target no other platform but iOS. You need to create one app in the Mobile Center portal with **iOS** as the OS and **Xamarin** as the platform.

##### 1.3 About Xamarin.Forms (iOS, Android and UWP)
Choose this option if you want to create a cross platform app for iOS, Android and UWP devices. You need to create 3 apps in Mobile Center – one for each OS.
You need to select **Xamarin** as the platform for Android and iOS applications (UWP does not have a Xamarin option

## 2. Create your app in the Mobile Center Portal to obtain the App Secret
If you have already created your app in the Mobile Center portal, you can skip this step.
 1) Head over to [mobile.azure.com.](https://mobile.azure.com/apps)
 2) Sign up or log in and hit the blue button on the top right corner of the portal that says ```Add new``` and select ```Add new app``` from the dropdown menu.
 3) Enter a name and an optional desciption for your app.
 4) Select the appropriate OS and platform depending on your project as described above.
 5) Hit the button at the bottom right that says ```Add new app```.

Once you have created an app, you can obtain its **App Secret** on the **Getting Started** or **Manage App sections** of the Mobile Center Portal.

## 3. Add the Mobile Center SDK to your solution
The Mobile Center SDK can be integrated using Xamarin Studio, Visual Studio, or the Package Manager Console.

**Visual Studio for Mac or Xamarin Studio** <br>
Under your project, select Packages, open context menu and click Add packages.
Search for Mobile Center, and select Mobile Center Analytics and Mobile Center Crashes.
Click Add Packages.

**Visual Studio for Windows** <br>
Navigate to the ```Project > Manage NuGet Packages...```
Search for **Mobile Center**, then install ```Microsoft.Azure.Mobile.Analytics``` and ```Microsoft.Azure.Mobile.Crashes``` packages.

**Package Manager Console** <br>
Make sure the Package Manager Console is opened in either Xamarin Studio or Visual Studio. You will have to install an add-in for Xamarin Studio.
Type the following commands:
```
PM> Install-Package Microsoft.Azure.Mobile.Analytics PM> Install-Package Microsoft.Azure.Mobile.Crashes 
```
Now that you've integrated the SDK in your application, it's time to start the SDK and make use of the Mobile Center services

## 4. Start the SDK
In order to use Mobile Center, you need to opt in to the module(s) that you want to use, meaning by default no modules are started and you will have to explicitly call each of them when starting the SDK.

**4.1 Add the using statements** <br>
Add the appropriate namespaces before you get started with using our APIs.
 * Xamarin.Android - Open your ```MainActivity.cs``` and add the following lines below the existing ```using``` statements.
 * Xamarin.iOS - Open you ```AppDelegate.cs``` and add the following lines below the existing ```using``` statements.
 * Xamarin.Forms - Open your ```App.xaml.cs``` in your shared project and add the following lines below the existing ```using``` statements:
 ```
using Microsoft.Azure.Mobile;
using Microsoft.Azure.Mobile.Analytics;
using Microsoft.Azure.Mobile.Crashes;
```

**4.2 Add the ```Start()``` method** <br>


# Supported versions and requirements
Mobile Center supports Portable Class Library (PCL) projects, but does not currently support .NET Standard. Mobile Center has no support for Components from the Xamarin Component Store and we advise using NuGet packages whenever they are available.


