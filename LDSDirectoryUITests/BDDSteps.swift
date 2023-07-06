//
//  BDDSteps.swift
//  LDSDirectoryUITests
//
//  Created by Carlos Bastida on 7/5/23.
//

import Foundation
import XCTest

func testPause(seconds: Double) {
    Thread.sleep(forTimeInterval: seconds) // Pause test execution for 2 seconds
}

func GivenTheAppIsRunning() {
    app.launch()
}

func ThenMainScreenAppears() {
    let label = app.staticTexts["Directory"]
    XCTAssertTrue(label.exists, "No navigation bar found")
}

func WhenUserTapsCell() {
    testPause(seconds: 5.0)
    let firstCell = app.staticTexts["individualLink0"]
    XCTAssertTrue(firstCell.exists, "Unable to locate first cell")
    firstCell.tap()
}

func ThenDetailScreenWithForceSensitiveAppears() {
    let label = app.buttons["backButton"]
    XCTAssertTrue(label.exists, "No navigation bar found")
}
