//
//  NSDecimalNumber+Optional.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

protocol OptionalNumber {}
extension NSNumber: OptionalNumber {}

extension Optional where Wrapped: OptionalNumber {
    var valueOrZero : NSDecimalNumber {
        
        guard let val = self as? NSNumber else {
            return NSDecimalNumber.zero
        }
        return NSDecimalNumber(decimal: val.decimalValue)
    }
}
