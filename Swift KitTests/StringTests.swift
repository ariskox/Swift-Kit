//
//  StringTests.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import XCTest
@testable import Swift_Kit

class StringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testOptionality() {
        let nilString: String? = nil
        let emptyString: String? = ""
        let aString: String? = "aString"
        
        XCTAssertTrue(nilString.isNilOrEmpty)
        XCTAssertTrue(emptyString.isNilOrEmpty)
        XCTAssertFalse(aString.isNilOrEmpty)
    }
    
    func testUppercaseAccentRemoved() {
        let greekLowercase = "αβγδεζηθικλμνξοπρστυφχψωάέήίόύώϊϋΐΰς"
        let greekUppercase = "ΑΒΓΔΕΖΗΘΙΚΛΜΝΞΟΠΡΣΤΥΦΧΨΩΑΕΗΙΟΥΩΙΥΙΥΣ"
        
        XCTAssertEqual(greekLowercase.uppercaseAccentRemovedString(), greekUppercase)
    }
    
    func testLuhn() {
        XCTAssertTrue("4111111111111111".isLuhn())
        XCTAssertTrue("5555555555554444".isLuhn())

        
        XCTAssertFalse("".isLuhn())
        XCTAssertFalse("a".isLuhn())
        XCTAssertFalse("4111111111111111a".isLuhn())
    }
}
