//
//  String+Uppercase.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

extension String {
    
    func uppercaseAccentRemovedString() -> String {
        
        let trimmedSelf = self.trimmingCharacters(in: CharacterSet.whitespaces)
        
        let replaced = trimmedSelf.replacingOccurrences(of: "ς",
                                                        with: "σ",
                                                        options: [.caseInsensitive],
                                                        range: nil)
        
        let cfstr = NSMutableString(string: String(replaced)) as CFMutableString
        var range = CFRangeMake(0, CFStringGetLength(cfstr))
        CFStringTransform(cfstr, &range, kCFStringTransformStripCombiningMarks, Bool(0))
        
        return (cfstr as String).uppercased()
    }
}
