# Step 1: Create a GitHub Account


**If you already have a GitHub account, you can jump directly to Step 2 below.**
Otherwise, please follow these steps to create your account:

### 1. Browse to [github.com/join](http://bit.ly/2h4uALD)

### 2. Enter in your username, e-mail address, and a password

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/1-1-create-account.png)

### 3. Chose "Unlimited public repositories for free." This is sufficient for this exercise, and you can easily upgrade to a paid account later.

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/1-2-choose-free-account.png)

### 4. Choose any additional options, or simply click "skip this step"

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/1-3-additional-account-options.png)

### 5. Confirm your e-mail address by clicking the "Verify email address" link in the e-mail you received to the address used in step 2 above. (note, if you skip this step, you won't be able to continue with the tutorial).

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/1-4-verify-email.png)

Congrats! You're now ready to move on to Step 2: Forking the repo

# Step 2: Forking the "MobileAzureDevDays" repo

### 1. Navigate to [github.com/jCho23/MobileAzureDevDays](http://bit.ly/2zqoeO7)

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/2-1-fork-repo.png)

### 2. Click the "Fork" icon in the top right corner.  You'll be brought to a subsequent screen showing that the repo is being forked, and then you'll ultimately arrive at your own forked copy of the repo that you'll use for the remainder of this exercise.

![Create new account](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/2-2-repo-forking.png)

# Step 3: Grab your "Sentiment Analysis" API Key

### 1. Please go to: [gist.github.com/jCho23](https://gist.github.com/jCho23/4fe26f529c084f941d82e510c3368a0c)

### 2. After you have copied the Sentiment Analysis API Key, please insert the key after: 
```const string _sentimentAPIKey```

![SentimentKey](https://github.com/jCho23/MobileAzureDevDays/blob/master/_Resources/Images/Sentiment%20Key.png)

# Step 4: Create an App in Visual Studio App Center
### 1. In the top right corner of App Center, click the "Add new" button, and select "Add new app"
### 2. Enter `MobileAzureDevDays [Android]` in the name field
### 3. For this exercise, choose Android for the OS, and Xamarin for the Platform.
### 4. Click "Add new app" in the bottom right corner

**Once created, Mobile Center will automatically navigate you to your newly created app**

# Step 5: Set up a Build

### 1. Click on the "Build" service from the left hand menu

Here, you will connect Mobile Center to your GitHub repository that you created at the beginning of this exercise

6. Select "Github"
7. Search for "MobileAzureDevDays"
8. Click on the "MobileAzureDevDays" repo in the search results

App Center will now perform it's magic, and connect up to your repo. Once this is done, we can set up our build.

9. Click on the "Master" branch
10. Click "Configure build"
11. Configure your app as show in the image below
12. Click "Save & Build"

App Center will now go ahead and build your app, and create a signed APK file.  Go ahead, grab a cup of coffee, this will only take a minute!

# Congratulations!
You've not built your first app using Visual Studio App Center.  For more information on how to ship 5-start apps with Visual Studio App Center, please visit [docs.microsoft.com/en-us/appcenter](https://docs.microsoft.com/en-us/appcenter/).  There you can find information on the Crash, Test, and Analytics capabilities of Visual Studio App Center, as well as how to integrate into additional services like Application Insights, or Visual Studio Team Services.
