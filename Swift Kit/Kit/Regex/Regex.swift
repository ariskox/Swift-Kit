//
//  Regex.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 24/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

/**
    A wrapper for regular expressions. Initialize once with a pattern
    and then test() if a string matches
 
 */

struct Regex {
    let internalExpression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) throws {
        self.pattern = pattern
        self.internalExpression = try NSRegularExpression(pattern: pattern, options: .caseInsensitive)
    }
    
    func test(input: String) -> Bool {
        let range = NSMakeRange(0, (input as NSString).length)
        
        return self.internalExpression.matches(in: input, options: [], range: range).count > 0
    }
}
