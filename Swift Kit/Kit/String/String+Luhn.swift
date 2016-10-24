//
//  String+Luhn.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

extension String {
    
    func isLuhn() -> Bool {
        let badCharacters = NSCharacterSet.decimalDigits.inverted
        
        guard characters.count > 0 && (self.rangeOfCharacter(from: badCharacters) == nil) else {
            return false
        }
        var sum : Int = 0
        var digit : Int = 0
        var flag = false
        
        for i in characters.reversed() {
            digit = (String(i) as NSString).integerValue
            
            if flag {
                digit = digit * 2
                if digit > 9 {
                    digit = digit - 9
                }
            }
            sum = sum + digit
            flag = !flag
        }
        
        return ((sum % 10) == 0)
    }
}
