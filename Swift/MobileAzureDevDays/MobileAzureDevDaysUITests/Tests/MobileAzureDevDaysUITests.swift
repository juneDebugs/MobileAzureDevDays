//
//  MobileAzureDevDaysUITests.swift
//  MobileAzureDevDaysUITests
//
//  Edited by Brandon Minnick on Feb 02 2018
//  Created by Sweekriti Satpathy on 11 October 2017.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import XCTest
import AppCenterXCUITestExtensions

class MobileAzureDevDaysUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    var sentimentPage: SentimentPage!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        
        ACTLaunch.launch(app)
        sentimentPage = SentimentPage(app: app)
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_SentimentPage_SubmitHappyText_ResultShouldBe😃() {
        //Arrange
        let happyText = "Happy"
        
        //Act
        sentimentPage.enterText(text: happyText)
        sentimentPage.tapSubmitButton()
        sentimentPage.waitForNoActivityIndicator(timeout: 10)
        
        //Assert
        let result = sentimentPage.getResults()
        XCTAssertTrue(result == "😃")        
        ACTLabel.labelStep("Correct Result Present")
    }
}
