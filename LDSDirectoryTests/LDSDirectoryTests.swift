//
//  LDSDirectoryTests.swift
//  LDSDirectoryTests
//
//  Created by Carlos Bastida on 7/5/23.
//

import XCTest
import CoreData
@testable import LDSDirectory

final class LDSDirectoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAffiliationColors() throws {
        let colorRed = getColor(affiliation: .sith)
        XCTAssertEqual(colorRed, .red)
        
        let colorGreen = getColor(affiliation: .jedi)
        XCTAssertEqual(colorGreen, .green)
        
        let colorBlue = getColor(affiliation: .rebel)
        XCTAssertEqual(colorBlue, .blue)
        
        let colorOrange = getColor(affiliation: .empire)
        XCTAssertEqual(colorOrange, .orange)
        
    }
    
    func testFormatDate() throws {
        let stringDate = "1977-05-25"
        let formatedDate = formatDate(dateString: stringDate)
        XCTAssertEqual(formatedDate, "May, 25, 1977")
    }
    
    func testForceType() throws {
        let forceTypeLight = getForceType(affiliation: .jedi)
        XCTAssertEqual(forceTypeLight, "light side")
        
        let forceTypeDark = getForceType(affiliation: .sith)
        XCTAssertEqual(forceTypeDark, "dark side")
    }
    

}
