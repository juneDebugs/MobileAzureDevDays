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
    let endpoint = "https://%@.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment"
    
    let apiKeyPreference = "\(Bundle.main.bundleIdentifier ?? "cognitive.text").apiKey"
    let regionPreference = "\(Bundle.main.bundleIdentifier ?? "cognitive.text").region"
    
    var apiKey: String? {
        get { return UserDefaults.standard.string(forKey: apiKeyPreference) }
        set(val) { UserDefaults.standard.set(val, forKey: apiKeyPreference) }
    }
    var region: String? {
        get { return UserDefaults.standard.string(forKey: regionPreference)! }
        set(val) { UserDefaults.standard.set(val, forKey: regionPreference) }
    }
    
    init(){
        region = "eastus2"
    }
    func obtainKey(callback: @escaping (SentimentApiKeyDocument?) -> ()) {
        let url = URL(string: "https://vsmcsentimentdemo.azurewebsites.net/api/GetSentimentKey")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue(contentType, forHTTPHeaderField: "Content-Type")
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            DispatchQueue.main.async { UIApplication.shared.isNetworkActivityIndicatorVisible = false }
            
            if let error = error {
                print(error.localizedDescription)
            }
            if let data=data, let keyData = try? JSONSerialization.jsonObject(with: data) as? [String:Any], let keyJson = keyData  {
                DispatchQueue.main.async { callback(SentimentApiKeyDocument(fromJson: keyJson)) }
            } else {
                DispatchQueue.main.async { callback(nil) }
            }
            }.resume()
    }
    
    func determineSentiment(_ text:String,  callback: @escaping (SentimentResponse?) -> ()) {
        
        if let apiKey = apiKey, let region = region, let data = try? JSONSerialization.data(withJSONObject: [ "documents" : [ [ "language" : Locale.current.languageCode ?? "en", "id" : textId, "text" : text ] ] ], options: []) {
            
            let url = URL(string: String(format: endpoint, region))
            
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
