//
//  FetchAssignmentUI_TestsLaunchTests.swift
//  FetchAssignmentUI_Tests
//
//  Created by Sai Jannali on 1/23/23.
//

import XCTest

final class FetchAssignmentUI_TestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
