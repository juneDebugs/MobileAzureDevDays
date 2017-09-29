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

**3.1. Project/solution**
Mobile Center automatically detects the solution and project files in your repository. Select the **.sln** or **.csproj/.fsproj** you would like to build.

###### 3.1.1. Building from the solution file (.sln)
In your code make sure to disable Android and UWP projects for build configs that are intended for iOS builds: go into the solution's configuration mappings, and for all mappings that target **iPhone** and **iPhoneSimulator**, uncheck all the projects which are targeting other platforms. This will ensure that when the **.sln** is building, it will not attempt to build the other projects. There is more solution configurations mapping information you can read.

###### 3.1.2. Building from the project file (.csproj/.fsproj)
In order to build from a **.csproj/.fsproj** file all the referenced projects (e.g. your PCL project) must contain the configuration with the same name as the one from your source iOS project. So, if you run the **Debug** configuration for the simulator in Mobile Center, your PCL project must have the **Debug|iPhoneSimulator** configuration. In case they don't exist and to prevent further errors we add such configurations before building your projects. Those configurations have basic default settings for Debug and Release only.

