# Xamarin.iOS Build

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


# Xamarin.Android Build

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
Ensure that the app requests the INTERNET permission.
Disable the Shared Mono Runtime. The Shared Mono Runtime will prevent UITests from running in Mobile Center for Test.
On Visual Studio 2017, open the project properties, and select the Android Options tab. The first section, Packaging Properties will have a checkbox for the Shared Mono Runtime.
On Visual Studio for Mac, look in the Project Options, under Build > Android Build. The Packaging and Deployment section of the General tab will have a checkbox for the Shared Mono Runtime.


# Supported versions and requirements
Mobile Center supports Portable Class Library (PCL) projects, but does not currently support .NET Standard. Mobile Center has no support for Components from the Xamarin Component Store and we advise using NuGet packages whenever they are available.



