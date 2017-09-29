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
Mobile Center automatically detects the solution and project files in your repository. Select the **.sln** or **.csproj/.fsproj** you would like to build.

###### 3.1.1. Building from the solution file (.sln)
In your code make sure to disable Android and UWP projects for build configs that are intended for iOS builds: go into the solution's configuration mappings, and for all mappings that target **iPhone** and **iPhoneSimulator**, uncheck all the projects which are targeting other platforms. This will ensure that when the **.sln** is building, it will not attempt to build the other projects. There is more solution configurations mapping information you can read.

###### 3.1.2. Building from the project file (.csproj/.fsproj)
In order to build from a **.csproj/.fsproj** file all the referenced projects (e.g. your PCL project) must contain the configuration with the same name as the one from your source iOS project. So, if you run the **Debug** configuration for the simulator in Mobile Center, your PCL project must have the **Debug|iPhoneSimulator** configuration. In case they don't exist and to prevent further errors we add such configurations before building your projects. Those configurations have basic 
default settings for Debug and Release only.

**3.2. Configuration** <br>
Select the configuration you would like to build with. The configurations are automatically detected depending on the source file picked in the previous step.

**3.3. Mono version** <br>
Mobile Center allows using different Mono environments for your build to maintain backward compatibility while releasing a support for new features. The default Mono version for a new branch configuration will be the latest one. You may choose to use one of the previous Mono environments to build older versions of frameworks or libraries.

**3.4. Xcode Version** <br>
Current version of Xamarin requires **Xcode 8.0 or higher**.

**3.5. Build triggers** <br>
By default a new build is triggered on every push a developer does to the configured branch. This is often referred to as **"Continuous Integration"**. If you prefer to manually trigger a new build, you can change this setting in the configuration pane.

**3.6. Simulator build** <br>
Simulator builds can only be ran on simulators and cannot be installed on the device, however the builds complete faster then device builds. If your build is not a simulator build, you need to upload code signing files in the next step.

**3.7. Increment build number** <br>
When enabled, the ```CFBundleVersion``` in the Info.plist of your app automatically increments for each build. The change happens pre build and won't be committed to your repository.

**3.8. Code signing** <br>
A successful device build will produce an ipa file. In order to install the build on a device, it needs to be signed with a valid provisioning profile and certificate. To sign the builds produced from a branch, enable code signing in the configuration pane and upload a provisioning profile (.mobileprovision) and a valid certificate (.p12), along with the password for the certificate. You can read more about code signing and device provisioning of Xamarin iOS apps in the Xamarin official documentation.

**3.9. Launch your successful build on a real device** <br>
Use your newly produced IPA file to test if your app starts on a real device. This will add approximately 10 more minutes to the total build time. You may want to check more comprehensive guide about testing your builds

**3.10. NuGet restore** <br>
If the NuGet.config file is checked-in into the repository and sitting next to the .sln or at the root, Mobile Center will auto-restore the NuGet feed. To restore private NuGet feeds, make sure you include the credentials in the NuGet.config file:
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
You can configure each successful build from a branch to be distributed to a previously created distribution group. You can add a new distribution group from within the Distribute section. There is always a default distribution group called "Collaborators" that includes all the users who have access to the app. <br>
Once you save the configuration, a new build will be automatically kicked off.




