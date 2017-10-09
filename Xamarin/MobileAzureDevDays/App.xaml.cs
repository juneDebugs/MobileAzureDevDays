using Xamarin.Forms;

using MobileAzureDevDays.Pages;

namespace MobileAzureDevDays
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();

            MainPage = new HomePage();
        }
    }
}
