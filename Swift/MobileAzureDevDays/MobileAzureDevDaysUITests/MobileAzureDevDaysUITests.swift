//
//  MobileAzureDevDaysUITests.swift
//  MobileAzureDevDaysUITests
//
//  Created by Sweekriti Satpathy on 10/11/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import XCTest
import AppCenterXCUITestExtensions

class MobileAzureDevDaysUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        ACTLaunch.launch(app)
        
        let textView = app.textViews.element(boundBy: 0)
        ACTLabel.labelStep("On Main Page")
        
        textView.tap()
        textView.typeText("Happy")
        ACTLabel.labelStep("Text Happy Entered")
        
        app.buttons["Submit"].tap()
        
        let result = app.staticTexts["😃"]
        XCTAssertTrue((result.waitForExistence(timeout: 10)))
        
        ACTLabel.labelStep("Result Present")
    }
    
}
