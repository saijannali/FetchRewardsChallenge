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
        
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_listRowNavigation() throws {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.tap()
        XCTAssertTrue(app.staticTexts["Apam balik"].exists)
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Desserts"].tap()
        
        app.staticTexts["Bakewell tart"].tap()
        XCTAssertTrue(app.staticTexts["chilled butter"].exists)
        app.navigationBars["_TtGC7SwiftUI19UIHosting"].buttons["Desserts"].tap()
    }

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTApplicationLaunchMetric()]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
