//
//  CareoUITests.swift
//  CareoUITests
//
//  Created by Karol Stępień on 14.06.2017.
//  Copyright © 2017 carlst. All rights reserved.
//

import XCTest

class CareoUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFlow() {
        let carsNavigationBar = app.navigationBars["Cars"]
        XCTAssert(carsNavigationBar.exists)

        carsNavigationBar.buttons["Add"].tap()
        
        let addNavigationBar = app.navigationBars["Add Car"]
        XCTAssert(addNavigationBar.exists)
    }
    
    func testAdding() {
        XCUIApplication().navigationBars["Cars"].buttons["Add"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let textField = elementsQuery.children(matching: .textField).element(boundBy: 0)
        textField.tap()
        textField.typeText("Lusso")
        app.buttons["Next:"].tap()
        
        let textField2 = elementsQuery.children(matching: .textField).element(boundBy: 1)
        textField2.typeText("Ferrari")
        
        let textField3 = app.scrollViews.otherElements.children(matching: .textField).element(boundBy: 3)
        textField3.tap()
        app.keys["2"].tap()
        app.keys["0"].tap()
        app.keys["1"].tap()
        app.keys["6"].tap()
        
        app.buttons["Save"].tap()
        
        let alertTitle = app.staticTexts["EMPTY FIELDS!"]
        XCTAssert(alertTitle.exists)
        let alertText = app.staticTexts["You need to provide data in all fields in order to continue."]
        XCTAssert(alertText.exists)
        app.buttons["Okay"].tap()
    }
    
}
