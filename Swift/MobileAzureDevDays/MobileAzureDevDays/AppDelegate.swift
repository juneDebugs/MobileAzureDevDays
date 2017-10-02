//
//  AppDelegate.swift
//  MobileAzureDevDays
//
//  Created by Colby Williams on 9/22/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		//SentimentClient.shared.apiKey = ""
		return true
	}

	
	func applicationDidBecomeActive(_ application: UIApplication) {
		showApiKeyAlert(application)
	}


	func showApiKeyAlert(_ application: UIApplication) {
		
		if SentimentClient.shared.apiKey == nil || SentimentClient.shared.apiKey!.isEmpty {
			
			let alertController = UIAlertController(title: "Configure App", message: "Enter a Text Analytics API Subscription Key. Or add the key in code in `didFinishLaunchingWithOptions`", preferredStyle: .alert)
			
			alertController.addTextField() { textField in
				textField.placeholder = "Subscription Key"
				textField.returnKeyType = .done
			}
			
			alertController.addAction(UIAlertAction(title: "Get Key", style: .default) { a in
				if let getKeyUrl = URL(string: "https://portal.azure.com/#blade/HubsExtension/BrowseResourceBlade/resourceType/Microsoft.CognitiveServices%2Faccounts") {
					UIApplication.shared.open(getKeyUrl, options: [:]) { opened in
						print("Opened GetKey url successfully: \(opened)")
					}
				}
			})
			
			alertController.addAction(UIAlertAction(title: "Done", style: .default) { a in
				if alertController.textFields?.first?.text == nil || alertController.textFields!.first!.text!.isEmpty {
					self.showApiKeyAlert(application)
				} else {
					SentimentClient.shared.apiKey = alertController.textFields!.first!.text
				}
			})
		
			window?.rootViewController?.present(alertController, animated: true) { }
		}
	}
}

