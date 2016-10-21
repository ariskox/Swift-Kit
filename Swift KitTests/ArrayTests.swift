//
//  ArrayTests.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import XCTest
@testable import Swift_Kit

class ArrayTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testArrayFindIncludedElement() {
        let array = (1..<100).map{ $0 }

        XCTAssertNil(array.find(includedElement: { return $0 == 0 }))
        XCTAssertTrue(array.find(includedElement: { return $0 == 1 }) == 0)
        XCTAssertTrue(array.find(includedElement: { return $0 == 99 }) == 98)
        XCTAssertNil(array.find(includedElement: { return $0 == 100 }))
    }
    
    func testArrayFindElement() {
        let array = (1..<100).map{ $0 }
        
        XCTAssertNil(array.find(element: 0))
        XCTAssertTrue(array.find(element: 1) == 0)
        XCTAssertTrue(array.find(element: 99) == 98)
        XCTAssertNil(array.find(element: 100))
    }
    
}
