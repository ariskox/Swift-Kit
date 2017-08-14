//
//  RobotoTests.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 24/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import XCTest
@testable import Swift_Kit

class RobotoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRobotoFontsIsLoaded() {
        
        XCTAssertNotNil(Roboto.familyName())
        XCTAssertNotNil(Roboto.Regular(15))
        XCTAssertNotNil(Roboto.Italic(15))
        XCTAssertNotNil(Roboto.Thin(15))
        XCTAssertNotNil(Roboto.ThinItalic(15))
        XCTAssertNotNil(Roboto.Light(15))
        XCTAssertNotNil(Roboto.LightItalic(15))
        XCTAssertNotNil(Roboto.Medium(15))
        XCTAssertNotNil(Roboto.MediumItalic(15))
        XCTAssertNotNil(Roboto.Bold(15))
        XCTAssertNotNil(Roboto.BoldItalic(15))
    }
    
}
