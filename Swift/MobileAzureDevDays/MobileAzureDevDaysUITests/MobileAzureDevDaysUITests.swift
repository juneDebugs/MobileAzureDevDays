//
//  MobileAzureDevDaysUITests.swift
//  MobileAzureDevDaysUITests
//
//  Created by Sweekriti Satpathy on 10/11/17.
//  Copyright © 2017 Colby Williams. All rights reserved.
//

import XCTest

class MobileAzureDevDaysUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        let app = XCUIApplication()
        
        let textView = app.textViews.element(boundBy: 0)
        textView.tap()
        textView.typeText("Happy")
        app.buttons["Submit"].tap()
        let result = app.staticTexts["😃"]
        XCTAssertTrue(result.exists)
    }
    
}
