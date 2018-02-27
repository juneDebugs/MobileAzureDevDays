//
//  MobileAzureDevDaysUITests.swift
//  MobileAzureDevDaysUITests
//
//  Edited by Brandon Minnick on 02 February 2018.
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
        
        ACTLabel.labelStep("App Launched")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func test_LauncheApp_TakeNoAction_ConfirmAppLaunches(){
        
    }
    
    func test_SentimentPage_SubmitHappyText_ResultShouldBeHappyEmoji() {
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
    
    func test_SentimentPage_SubmitSadText_ResultShouldBeSadEmoji() {
        //Arrange
        let sadText = "Sad"
        
        //Act
        sentimentPage.enterText(text: sadText)
        sentimentPage.tapSubmitButton()
        sentimentPage.waitForNoActivityIndicator(timeout: 10)
        
        //Assert
        let result = sentimentPage.getResults()
        XCTAssertTrue(result == "☹️")
        ACTLabel.labelStep("Correct Result Present")
    }
    
    func test_SentimentPage_SubmitSadText_ResultShouldBeNeutralEmoji() {
        //Arrange
        let neutralText = "Mitigations in Seattle"
        
        //Act
        sentimentPage.enterText(text: neutralText)
        sentimentPage.tapSubmitButton()
        sentimentPage.waitForNoActivityIndicator(timeout: 10)
        
        //Assert
        let result = sentimentPage.getResults()
        XCTAssertTrue(result == "😐")
        ACTLabel.labelStep("Correct Result Present")
    }
}
