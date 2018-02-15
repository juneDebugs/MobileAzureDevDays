using System;
using System.IO;
using System.Linq;
using NUnit.Framework;
using Xamarin.UITest;
using Xamarin.UITest.Queries;

using Query = System.Func<Xamarin.UITest.Queries.AppQuery, Xamarin.UITest.Queries.AppQuery>;

namespace MobileAzureDevDays.UITests
{
    [TestFixture(Platform.Android)]
    [TestFixture(Platform.iOS)]
    public class Tests
    {
        IApp app;
        Platform platform;

        public Tests(Platform platform)
        {
            this.platform = platform;
        }

        [SetUp]
        public void BeforeEachTest()
        {
            app = AppInitializer.StartApp(platform);
        }

        [Test]
        public void EmojiTest()
        {
            string textValue = "Happy";
            Query EnterTextField = x => x.Marked("EnterTextBox");
            Query SubmitButton = x => x.Marked("SubmitButton");
            Query ResultLabel = x => x.Marked("ResultEmojiLabel");

            app.WaitForElement(EnterTextField);
            app.Screenshot("On Main Page");

            app.Tap(EnterTextField);
            app.EnterText(textValue);
            app.DismissKeyboard();
            app.Screenshot($"Text value entered :: {textValue}");

            app.Tap(SubmitButton);
            app.WaitForElement(ResultLabel);
            Assert.NotNull(ResultLabel, "ResultLabel did not Load");
            app.Screenshot("Result Emoji Loaded");
        }
    }
}
