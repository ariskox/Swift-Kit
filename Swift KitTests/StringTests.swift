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
    
    func testIsEmail() {
        
        XCTAssertTrue("abcd@abcd.com".isEmail())
        XCTAssertTrue("abcd@very.long.domain.with.subdomain.org".isEmail())
        XCTAssertTrue("ABCD@ABCD.COM".isEmail())
        XCTAssertFalse("abcd@abcd.nonexisting".isEmail())
        
        XCTAssertFalse("".isEmail())
        XCTAssertFalse("1".isEmail())
        XCTAssertFalse("@com".isEmail())
        XCTAssertFalse("@zz.com".isEmail())
        XCTAssertFalse("z@com".isEmail())
        XCTAssertFalse("abcd@@abcd.com".isEmail())
        XCTAssertFalse("abcd@".isEmail())
        XCTAssertFalse("abcd@.".isEmail())
        XCTAssertFalse("abcd@.com".isEmail())
        
        XCTAssertFalse("abcd@abcd.google".isEmail())
        XCTAssertTrue("abcd@abcd.google".isEmail(extended: true ))
        XCTAssertTrue("abcd@abcd.accountants".isEmail(extended: true ))
        XCTAssertTrue("abcd@abcd.bananarepublic".isEmail(extended: true ))

    }
}
