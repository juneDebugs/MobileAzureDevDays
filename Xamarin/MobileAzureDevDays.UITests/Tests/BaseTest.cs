using NUnit.Framework;

using Xamarin.UITest;

namespace MobileAzureDevDays.UITests
{
    [TestFixture(Platform.Android)]
    [TestFixture(Platform.iOS)]
    public abstract class BaseTest
    {
        #region Constant Fields
        readonly Platform _platform;
        #endregion

        #region Constructors
        protected BaseTest(Platform platform) => _platform = platform;
        #endregion

        #region Properties
        protected IApp App { get; private set; }
        protected SentimentPage SentimentPage { get; private set; }
        #endregion

        #region Methods
        [SetUp]
        public virtual void TestSetup()
        {
            App = AppInitializer.StartApp(_platform);

            SentimentPage = new SentimentPage(App);

            App.Screenshot("App Launched");
        }

        [TearDown]
        public virtual void TestTearDown()
        {
        }
        #endregion
    }

}
