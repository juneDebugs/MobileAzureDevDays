# Step 1: Create a GitHub Account

If you already have a GitHub account, you can jump directly to Step 2 below.  Otherwise, please follow these steps to create your account:

1. Browse to [https://github.com/join](https://github.com/join)
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

1. Navigate to [https://github.com/jCho23/MobileAzureDevDays](https://github.com/jCho23/MobileAzureDevDays)

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/2-1-fork-repo.png)

2. Click the "Fork" icon in the top right corner.  You'll be brought to a subsequent screen showing that the repo is being forked, and then you'll ultimately arrive at your own forked copy of the repo that you'll use for the remainder of this exercise.

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/2-2-repo-forking.png)

# Step 3: Create your Azure Account

There are several different ways to create an Azure account.  A few examples are:

a. Your company/employer has a subscription, and has added you to it
b. You have a visualstudio.com subscription (i.e. Enterprise, Professional, or Dev Essentials), and you have the associated Azure credits
c. You've already signed up for the "Azure free account"

To check to see if you have an Azure subscription already, browse to [https://portal.azure.com](https://portal.azure.com).  Sign in with your existing Microsoft.com account, and browse to the "Subscriptions" blade in the Azure portal.

If you do not already have an account/subscription, you will be prompted to create one.  If you need to create a new account/subscription, browse to [https://azure.microsoft.com/en-us/free/](https://azure.microsoft.com/en-us/free/), and click the "Start free" button to begin starting your account.

### Note: 
You will need to enter in a credit card to create your account.  This card will _only_ be used to pay for charges that exceeed your monthly allocation (e.g. $150/mo for Enterprise users).

# Step 4: Grab your "Sentiment Analysis" API Key

1. Navigation to [https://ms.portal.azure.com/#blade/HubsExtension/Resources/resourceType/Microsoft.CognitiveServices%2Faccounts](https://ms.portal.azure.com/#blade/HubsExtension/Resources/resourceType/Microsoft.CognitiveServices%2Faccounts).

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

# Step 5: Update your code in GitHub with the API key

1. Browse to your GitHub repo, and then select 

- MobileAzureDevDays > Xamarin > MobileAzureDevDays > Services

2. Choose the file TextAnalysis.cs, end then choose the "Edit" icon
3. Paste your API key from step 4.3 above into the `_sentimentAPIKey` variable on line 14
4. Scroll to the bottom and enter in any comment into the "Commit changes" field set, and click "Commit changes" button to commit your key to source control

Note: For this exercise, we are commiting your API key to source control.  In general, we recommend using services like [Azure Key Vault](https://azure.microsoft.com/en-us/services/key-vault/) to securely store your API keys, and integrate them into your code during your build.


# Step 6: Create your Mobile Center Account

In this step, we're not going to sign into Mobile Center using our Github credentials, and set up our builds. Since you are already signed in to GitHub, we can simply authorize Mobile Center to access your GitHub repositories using the following steps.

1. Browse to [https://mobile.azure.com](https://mobile.azure.com)
2. Click on "Connect with GitHub"
3. Click the "Authorize MobileCenter" button


# Step 7: Create and App in Mobile Center

1. In the top right corner of Mobile Center, click the "Add new" button, and select "Add new app"
2. Enter `MobileAzureDevDays [Android]` in the name field
3. For this exercise, choose Android for the OS, and Xamarin for the Platform.
4. Click "Add new app" in the bottom right corner

Once created, Mobile Center will automatically navigate you to your newly created app

# Step 8: Set up a Build


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


Mobile center will now go ahead and build your app, and create a signed APK file.  Go ahead, grab a cup of coffee, this will only take a minute


# Step 9: Distribute your app

Awesome, we're back.  Now that we've built an app, we can go ahead and distribute it

1. On your completed build, click the "Distribute" button
2. Choose the group you want to distribute to (you will only see "Collaborators", but documentation on creating additional distribution groups can be found [here](https://docs.microsoft.com/en-us/mobile-center/distribution/groups)), and click "Next"
3. Enter in any comments that you want to show as release notes
4. Click "Distribute"

Once the distribution is complete, everyone in the distribution list will receive an e-mail letting them know that they can download/install the release.  Alternatively, you can browse to [https://install.mobile.azure.com](https://install.mobile.azure.com) from your mobile device (Safari on iOS, Chrome on Android) to view available releases.

# Congratulations!

You've not built, and distributed your first app using Visual Studio Mobile Center.  For more information on how to ship 5-start apps with Visual Studio Mobile Center, please visit [https://docs.mobile.azure.com](https://docs.mobile.azure.com).  There you can find information on the Crash, Test, and Analytics capabilities of Visual Studio Mobile Center, as well as how to integrate into additional services like Application Insights, or Visual Studio Team Services.


