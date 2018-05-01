using System;
using System.Linq;
using System.Threading.Tasks;
using System.Collections.Generic;

using Microsoft.Azure.CognitiveServices.Language.TextAnalytics;
using Microsoft.Azure.CognitiveServices.Language.TextAnalytics.Models;

namespace MobileAzureDevDays.Services
{
	static class TextAnalysisService
	{
		readonly static Lazy<TextAnalyticsAPI> _textAnalyticsApiClientHolder = new Lazy<TextAnalyticsAPI>(() =>
			new TextAnalyticsAPI
			{
				AzureRegion = AzureRegions.Westus,
				SubscriptionKey = CognitiveServicesConstants.TextApiKey
			});

		static TextAnalyticsAPI TextAnalyticsApiClient => _textAnalyticsApiClientHolder.Value;

		public static async Task<double?> GetSentiment(string text)
		{
			var sentimentDocument = new MultiLanguageBatchInput(new List<MultiLanguageInput> { { new MultiLanguageInput(id: "1", text: text) } });

			var sentimentResults = await TextAnalyticsApiClient.SentimentAsync(sentimentDocument).ConfigureAwait(false);

            if(sentimentResults?.Errors?.Any() ?? false)
			{
				var errorMessageList = sentimentResults.Errors.Select(x => x.Message);
				var exceptionList = errorMessageList.Select(x => new Exception(x));

				throw new AggregateException(exceptionList);
			}

			var documentResult = sentimentResults?.Documents?.FirstOrDefault();

			return documentResult?.Score;
		}
	}
}
