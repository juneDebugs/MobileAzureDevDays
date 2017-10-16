package com.xamarin.azuredevdays.uitest;


import android.support.test.espresso.ViewInteraction;
import android.support.test.espresso.matcher.ViewMatchers;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;
import android.test.suitebuilder.annotation.LargeTest;

import com.xamarin.azuredevdays.MainActivity;
import com.xamarin.azuredevdays.R;

import org.junit.After;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;

import static android.support.test.espresso.Espresso.onData;
import static android.support.test.espresso.Espresso.onView;
import static android.support.test.espresso.action.ViewActions.*;
import static android.support.test.espresso.assertion.ViewAssertions.*;
import static android.support.test.espresso.matcher.ViewMatchers.*;
import static org.hamcrest.CoreMatchers.allOf;

import android.support.test.runner.AndroidJUnit4;
import com.xamarin.testcloud.espresso.Factory;
import com.xamarin.testcloud.espresso.ReportHelper;


@LargeTest
@RunWith(AndroidJUnit4.class)
public class EmojiTestRecord {

    @Rule
    public ActivityTestRule<MainActivity> mActivityTestRule = new ActivityTestRule<>(MainActivity.class);

    @Rule
    public ReportHelper reportHelper = Factory.getReportHelper();

    @Test
    public void emojiTestRecord()  {
        ViewInteraction appCompatEditText = onView(
                allOf(ViewMatchers.withId(R.id.sentimentText),
                        withParent(withId(R.id.backGroundLayout)),
                        isDisplayed()));

        reportHelper.label("On Main Page");
        appCompatEditText.perform(click());

        ViewInteraction appCompatEditText2 = onView(
                allOf(withId(R.id.sentimentText),
                        withParent(withId(R.id.backGroundLayout)),
                        isDisplayed()));
        appCompatEditText2.perform(replaceText("Happy"), closeSoftKeyboard());
        reportHelper.label("Text value entered:: Happy");

        ViewInteraction appCompatButton = onView(
                allOf(withId(R.id.getSentimentButton), withText("Submit"),
                        withParent(withId(R.id.backGroundLayout)),
                        isDisplayed()));
        appCompatButton.perform(click());

        try {
            Thread.sleep(10000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        onView(withId(R.id.emojiView)).check(matches(isDisplayed()));

        reportHelper.label("Result Emoji Loaded");

    }

    @After
    public void TearDown(){
        reportHelper.label("Stopping App");
    }

}
