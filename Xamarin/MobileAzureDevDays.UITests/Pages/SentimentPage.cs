using System.Linq;

using Xamarin.UITest;

using MobileAzureDevDays.Shared.Constants;

using Query = System.Func<Xamarin.UITest.Queries.AppQuery, Xamarin.UITest.Queries.AppQuery>;

namespace MobileAzureDevDays.UITests
{
    public class SentimentPage : BasePage
    {
        readonly Query submitButton, enterTextBox, activityIndicator, emojiResultsLabel;

        public SentimentPage(IApp app) : base(app, PageTitles.SentimentPage)
        {
            submitButton = x => x.Marked(AutomationIdConstants.SubmitButton);
            enterTextBox = x => x.Marked(AutomationIdConstants.EnterTextBox);
            activityIndicator = x => x.Marked(AutomationIdConstants.ActivityIndicator);
            emojiResultsLabel = x => x.Marked(AutomationIdConstants.EmojiResultsLabel);
        }

        public string EmojiResultsText => App.Query(emojiResultsLabel)?.FirstOrDefault()?.Text;

        public void TapSubmitButton()
        {
            App.Tap(submitButton);
            App.Screenshot("Submit Button Tapped");
        }

        public void EnterText(string text)
        {
            App.EnterText(enterTextBox, text);
            App.Screenshot($"Entered Text: {text}");
        }

        public void WaitForActivityIndicator()
        {
            App.WaitForElement(activityIndicator);
            App.Screenshot("Activity Indicator Appeared");
        }

        public void WaitForNoActivityIndicator()
        {
            App.WaitForNoElement(activityIndicator);
            App.Screenshot("Activity Indicator Disappeared");
        }
    }
}
