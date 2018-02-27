//
//  SentimentPage.swift
//  MobileAzureDevDaysUITests
//
//  Created by Brandon Minnick on 2/14/18.
//  Copyright © 2018 Colby Williams. All rights reserved.
//

import XCTest
import AppCenterXCUITestExtensions

class SentimentPage{
    
    var textView: XCUIElement
    var submitButton: XCUIElement
    var resultsLabel: XCUIElement
    var activityIndicator: XCUIElement
    
    init(app: XCUIApplication) {
        textView = app.textViews.element(boundBy: 0)
        submitButton = app.buttons["Submit"]
        resultsLabel = app.staticTexts.element(matching: .any, identifier: "EmojiLabel")
        activityIndicator = app.activityIndicators.element(matching: .any, identifier: "ActivityIndicator")
        
        ensureXCUIElementsExist()
    }
    
    public func tapSubmitButton() {
        submitButton.tap()
        ACTLabel.labelStep("Submit Button Tapped")
    }
    
    public func enterText(text: String){
        textView.tap()
        textView.typeText(text)
        ACTLabel.labelStep("Entered \(text)")
    }
    
    public func getResults() -> String{
        let labelText = resultsLabel.label
        return labelText
    }
    
    public func waitForActivityIndicator(timeout: TimeInterval){
        XCTAssertTrue((activityIndicator.waitForExistence(timeout: timeout)))
        ACTLabel.labelStep("Activity Indicator Appeared")
    }
    
    public func waitForNoActivityIndicator(timeout: TimeInterval){
        XCTAssertFalse((activityIndicator.waitForExistence(timeout: timeout)))
        ACTLabel.labelStep("Activity Indicator Disappeared")
    }
    
    func ensureXCUIElementsExist() {
        XCTAssertTrue(textView.exists)
        XCTAssertTrue(submitButton.exists)
        XCTAssertTrue(resultsLabel.exists)
    }
}
