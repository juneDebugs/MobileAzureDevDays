//
//  SentimentClient.swift
//  MobileAzureDevDays
//
//  Created by Colby Williams on 9/22/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import Foundation
import UIKit

class SentimentClient {
	
	static let shared: SentimentClient = {
		let instance = SentimentClient()
		return instance
	}()

	let textId = "sentimentText"
	let contentType = "application/json"
	let endpoint = "https://eastus2.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment"

	let apiKeyPreference = "\(Bundle.main.bundleIdentifier ?? "cognitive.text").apiKey"
	
	var apiKey: String? {
		get { return UserDefaults.standard.string(forKey: apiKeyPreference) }
		set(val) { UserDefaults.standard.set(val, forKey: apiKeyPreference) }
	}
	
	func determineSentiment(_ text:String,  callback: @escaping (SentimentResponse?) -> ()) {
		
		if let apiKey = apiKey, let data = try? JSONSerialization.data(withJSONObject: [ "documents" : [ [ "language" : Locale.current.languageCode ?? "en", "id" : textId, "text" : text ] ] ], options: []) {
			
			let url = URL(string: endpoint)
			
			var request = URLRequest(url: url!)
			
			request.httpMethod = "POST"
			
			request.addValue(contentType, forHTTPHeaderField: "Content-Type")
			request.addValue(apiKey, forHTTPHeaderField: "Ocp-Apim-Subscription-Key")

			request.httpBody = data
			
			UIApplication.shared.isNetworkActivityIndicatorVisible = true
			
			URLSession.shared.dataTask(with: request) { (data, response, error) in
				
				DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
				
				if let error = error {
					print(error.localizedDescription)
				}
				if let data = data, let sentimentData = try? JSONSerialization.jsonObject(with: data) as? [String:Any], let sentimentJson = sentimentData  {
					DispatchQueue.main.async { callback(SentimentResponse(fromJson: sentimentJson)) }
				} else {
					DispatchQueue.main.async { callback(nil) }
				}
			}.resume()
		}
	}
}
