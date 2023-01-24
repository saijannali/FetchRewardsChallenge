//
//  FetchAssignmentUI_Tests.swift
//  FetchAssignmentUI_Tests
//
//  Created by Sai Jannali on 1/23/23.
//

import XCTest

final class FetchAssignmentUI_Tests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }
    
    func test_listRowNavigation() throws {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        XCTAssertTrue(app.staticTexts["Apam balik"].exists)
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Desserts"].tap()
        
        app.staticTexts["Bakewell tart"].tap()
        XCTAssertTrue(app.staticTexts["chilled butter"].exists)
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Desserts"].tap()
    }
}
