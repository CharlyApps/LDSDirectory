//
//  LDSDirectoryUITests.swift
//  LDSDirectoryUITests
//
//  Created by Carlos Bastida on 7/5/23.
//

import XCTest
let app = XCUIApplication()

final class LDSDirectoryUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testLaunch() {
        GivenTheAppIsRunning()
    }
    
    func testMainDirectoryAppears() {
        GivenTheAppIsRunning()
        ThenMainScreenAppears()
    }
    
    func testUserIsforceSensitive() {
        GivenTheAppIsRunning()
        ThenMainScreenAppears()
        WhenUserTapsCell()
        ThenDetailScreenWithForceSensitiveAppears()
    }
}
