//
//  ViewController.swift
//  MobileAzureDevDays
//
//  Created by Colby Williams on 9/22/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

	@IBOutlet weak var sentimentTextView: UITextView!
	@IBOutlet weak var sentimentTextContainer: UIView!
	@IBOutlet weak var sentimentTextPlaceholder: UILabel!
	
	@IBOutlet weak var submitButton: UIButton!
	
	@IBOutlet weak var activityIndicator: UIActivityIndicatorView!
	@IBOutlet weak var activityLabel: UILabel!
	
	@IBOutlet weak var emojiLabel: UILabel!
	
	
	let submit = "Submit"
	let reset = "Reset"
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupBorders()
	}

	
	@IBAction func submitButtonTouchUpInside(_ sender: Any) {
		
		if submitButton.currentTitle == submit {
		
			if !sentimentTextView.hasText {
				showErrorAlert("Hold up", message: "Gotta add some text first.", dismiss: "Got it"); return
			}
			
			setActivity(true)
			
			SentimentClient.shared.determineSentiment(sentimentTextView.text) { sentimentResponse in
				
				self.setActivity(false)
				
				if let response = sentimentResponse, let document = response.documents.first {
				
					self.setSentiment(Sentiment.getSentiment(document.score))
				
				} else {
					
					self.showErrorAlert("Error \(sentimentResponse?.errorStatusCode ?? -1)", message: sentimentResponse?.errorMessage ?? "", dismiss: "Okay")
				}
			}
			
		} else if submitButton.currentTitle == reset {
			
			setSentiment(nil)
			
			resetTextView()
		}
	}
	
	
	func showErrorAlert(_ title:String, message:String, dismiss:String) {

		let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
		
		alertController.addAction(UIAlertAction(title: dismiss, style: .default) { a in
			self.dismiss(animated: true) { }
		});
		
		present(alertController, animated: true) {}
	}

	
	func setSentiment(_ sentiment:Sentiment?) {
		emojiLabel.text = sentiment?.emoji
		view.backgroundColor = sentiment?.color ?? #colorLiteral(red: 1, green: 0.4352941176, blue: 0.4117647059, alpha: 1)
		submitButton.setTitle(sentiment == nil ? submit : reset, for: .normal)
	}
	
	
	func resetTextView() {
		sentimentTextView.text = nil
		sentimentTextPlaceholder.isHidden = false
		sentimentTextView.isEditable = true
	}
	
	
	func setActivity(_ activity: Bool) {
		activityLabel.isHidden = !activity
		activityIndicator.isHidden = !activity
		sentimentTextView.isEditable = !activity
		submitButton.isUserInteractionEnabled = !activity
		
		if activity && !activityIndicator.isAnimating {
			activityIndicator.startAnimating()
		}
	}
	
	
	func setupBorders() {
		sentimentTextContainer.layer.borderWidth = 1
		sentimentTextContainer.layer.borderColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
		sentimentTextContainer.layer.cornerRadius = 8
		
		submitButton.layer.borderWidth = 1.5
		submitButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
	}

	
	override var preferredStatusBarStyle: UIStatusBarStyle {
		return .lightContent
	}
	
	
	// MARK - UITextViewDelegate
	
	func textViewDidChange(_ textView: UITextView) {
		sentimentTextPlaceholder.isHidden = textView.hasText
	}
}
