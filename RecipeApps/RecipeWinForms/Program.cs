using CPUFramework;
using RecipeSystem;
namespace RecipeWinForms
{
    internal static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            // To customize application configuration such as set high DPI settings or default font,
            // see https://aka.ms/applicationconfiguration.
            ApplicationConfiguration.Initialize();

            //Local
            //DBManager.SetConnectionString  ("Server=.\\SQLExpress;Database=HeartyHearthDB;Trusted_Connection=true");

            //Live
            //DBManager.SetConnectionString("Server=tcp:ygrumet.database.windows.net,1433;Initial Catalog=HeartyHearthDB;Persist Security Info=False;User ID=cpuadmin;Password=098BGtr!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");

            Application.Run(new frmSearch());
        }
    }
}