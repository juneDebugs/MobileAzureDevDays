# Step 1: Create a GitHub Account

If you already have a GitHub account, you can jump directly to Step 2 below.  Otherwise, please follow these steps to create your account:

1. Browse to [github.com/join](http://bit.ly/2h4uALD)
2. Enter in your username, e-mail address, and a password

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/1-1-create-account.png)

3. Chose "Unlimited public repositories for free." This is sufficient for this exercise, and you can easily upgrade to a paid account later.

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/1-2-choose-free-account.png)

4. Choose any additional options, or simply click "skip this step"

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/1-3-additional-account-options.png)

5. Confirm your e-mail address by clicking the "Verify email address" link in the e-mail you received to the address used in step 2 above. (note, if you skip this step, you won't be able to continue with the tutorial).

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/1-4-verify-email.png)

Congrats! You're now ready to move on to Step 2: Forking the repo

# Step 2: Forking the "MobileAzureDevDays" repo

1. Navigate to [github.com/jCho23/MobileAzureDevDays](http://bit.ly/2zqoeO7)

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/2-1-fork-repo.png)

2. Click the "Fork" icon in the top right corner.  You'll be brought to a subsequent screen showing that the repo is being forked, and then you'll ultimately arrive at your own forked copy of the repo that you'll use for the remainder of this exercise.

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/2-2-repo-forking.png)

# Step 4: Grab your "Sentiment Analysis" API Key

1. Navigation to [ms.portal.azure.com](http://bit.ly/2iSQ8LK).

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/4-1-cognitive-services.png)

2. Click the "Add" button
3. Search for `Text Analytics API`

![Search Results](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/4-2-search-results.png)

Complete the fields as required

- Name: enter in any unique name
- Subscription: Choose whichever subscription you have access to
- Location: Choose a location for the data center
- Pricing Tier: F0 (20 Calls per minute, 5K Calls per month)
- Resource Group (Create new): enter in a name for your resource group
- Click to confirm the terms of service
- Click "Create"

2. Once your Computer Vision app has been created, browse to the resource in the Azure portal.
3. Select the "Keys" blade, and copy one of the two available keys

# Step 5: Create your App Center Account

In this step, we're not going to sign into App Center using our Github credentials, and set up our builds. Since you are already signed in to GitHub, we can simply authorize Mobile Center to access your GitHub repositories using the following steps.

1. Browse to [mobile.azure.com](http://bit.ly/2ygLNrH)
2. Click on "Connect with GitHub"
3. Click the "Authorize MobileCenter" button

# Step 6: Create and App in Mobile Center
1. In the top right corner of Mobile Center, click the "Add new" button, and select "Add new app"
2. Enter `MobileAzureDevDays [Android]` in the name field
3. For this exercise, choose Android for the OS, and Xamarin for the Platform.
4. Click "Add new app" in the bottom right corner

Once created, Mobile Center will automatically navigate you to your newly created app

# Step 7: Set up a Build

5. Click on the "Build" service from the left hand menu

Here, you will connect Mobile Center to your GitHub repository that you created at the beginning of this exercise

6. Select "Github"
7. Search for "MobileAzureDevDays"
8. Click on the "MobileAzureDevDays" repo in the search results

Mobile Center will now perform it's magic, and connect up to your repo. Once this is done, we can set up our build.

9. Click on the "Master" branch
10. Click "Configure build"
11. Configure your app as show in the image below
12. Click "Save & Build"

Mobile center will now go ahead and build your app, and create a signed APK file.  Go ahead, grab a cup of coffee, this will only take a minute!

# Congratulations!
You've not built your first app using Visual Studio Mobile Center.  For more information on how to ship 5-start apps with Visual Studio Mobile Center, please visit [docs.mobile.azure.com](http://bit.ly/2gV5uuV).  There you can find information on the Crash, Test, and Analytics capabilities of Visual Studio Mobile Center, as well as how to integrate into additional services like Application Insights, or Visual Studio Team Services.
