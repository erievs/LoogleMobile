using Microsoft.Extensions.Logging;

namespace LooglePlusMobile;

public static class MauiProgram
{
	public static MauiApp CreateMauiApp()
	{
		var builder = MauiApp.CreateBuilder();
		builder
			.UseMauiApp<App>()
			.ConfigureFonts(fonts =>
			{
				fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
				fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
				fonts.AddFont("Catull.ttf", "Catull");
				fonts.AddFont("Catull-Bold.ttf", "CatullBold");
				fonts.AddFont("ProductSans-Bold-Italic.ttf", "ProductSansBoldItalic");
				fonts.AddFont("ProductSans-Bold.ttf", "ProductSansBold");
				fonts.AddFont("ProductSans-Italic.ttf", "ProductSansItalic");
				fonts.AddFont("ProductSans-Regular.ttf", "ProductSansRegular");
			});

#if DEBUG
		builder.Logging.AddDebug();
#endif

		return builder.Build();
	}
}
