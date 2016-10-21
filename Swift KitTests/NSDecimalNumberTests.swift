//
//  NSDecimalNumberTests.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import XCTest
@testable import Swift_Kit

class NSDecimalNumberTests: XCTestCase {

    let nullNumber: NSDecimalNumber? = nil
    let zeroNullable: NSDecimalNumber? = NSDecimalNumber(string: "0")
    let oneNullable: NSDecimalNumber? = NSDecimalNumber(string: "1")

    let zero = NSDecimalNumber(string: "0")
    let one = NSDecimalNumber(string: "1")
    let two = NSDecimalNumber(string: "2")
    let four = NSDecimalNumber(string: "4")
    let minusOne = NSDecimalNumber(string: "-1")

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInitializer() {
        XCTAssertEqual(NSDecimalNumber(0), NSDecimalNumber(string: "0"))
        XCTAssertEqual(NSDecimalNumber(1), NSDecimalNumber(string: "1"))
        XCTAssertEqual(NSDecimalNumber(-1), NSDecimalNumber(string: "-1"))
        XCTAssertEqual(NSDecimalNumber(1.1), NSDecimalNumber(string: "1.1"))
    }
    
    func testOptionality() {
        XCTAssertEqual(nullNumber.valueOrZero, zero)
        XCTAssertEqual(zeroNullable.valueOrZero, zero)
        XCTAssertEqual(oneNullable.valueOrZero, one)
    }
    
    func testEqualityOperators() {
        XCTAssertTrue(zero < one)
        XCTAssertFalse(zero > one)
        XCTAssertTrue(one > zero)
        XCTAssertFalse(one < zero)
        
        XCTAssertFalse(one == zero)
        XCTAssertTrue(zero == zero)

        XCTAssertTrue(nullNumber.valueOrZero == zero)
    }
    
    func testArithmeticOperators() {
        XCTAssertTrue(-one == minusOne)
        XCTAssertTrue(-zero == zero)

        XCTAssertTrue(zero+zero == zero)
        XCTAssertTrue(one+one == two)
        XCTAssertTrue(one+minusOne == zero)
        
        XCTAssertTrue(one-one == zero)
        XCTAssertTrue(zero-zero == zero)
        XCTAssertTrue(one-minusOne == two)

        XCTAssertTrue(one*one == one)
        XCTAssertTrue(one*minusOne == minusOne)
        XCTAssertTrue(one*zero == zero)
        
        XCTAssertTrue(one/minusOne == minusOne)
        XCTAssertTrue(one/one == one)

        XCTAssertTrue(one^0 == one)
        XCTAssertTrue(one^1 == one)
        XCTAssertTrue(two^2 == four)
    }
}
