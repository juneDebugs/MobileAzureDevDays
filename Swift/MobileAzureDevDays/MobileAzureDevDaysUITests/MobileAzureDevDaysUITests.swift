//
//  MobileAzureDevDaysUITests.swift
//  MobileAzureDevDaysUITests
//
//  Created by Sweekriti Satpathy on 10/11/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import XCTest
import VSMobileCenterExtensions

class MobileAzureDevDaysUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
//        XCUIApplication().launch()
//        MCLaunch.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        let launched = MCLaunch.launch(app)
        
        let textView = app.textViews.element(boundBy: 0)
        MCLabel.labelStep("On Main Page")
        textView.tap()
        textView.typeText("Happy")
        MCLabel.labelStep("Text Happy Entered")
        app.buttons["Submit"].tap()
        let result = app.staticTexts["😃"]
        XCTAssertTrue((result.exists))
        MCLabel.labelStep("Result Present")
    }
    
}
