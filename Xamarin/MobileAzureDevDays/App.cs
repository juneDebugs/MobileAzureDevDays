using Xamarin.Forms;
using Xamarin.Forms.Xaml;

using MobileAzureDevDays.Pages;

[assembly: XamlCompilation(XamlCompilationOptions.Compile)]
namespace MobileAzureDevDays
{
    public class App : Application
    {
        public App() => MainPage = new SentimentPage();
    }
}
