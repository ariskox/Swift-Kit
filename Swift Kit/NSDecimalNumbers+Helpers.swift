//
//  NSDecimalNumbers+Helpers.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

// MARK: - Comparable

extension NSDecimalNumber: Comparable {}

public func ==(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
    return lhs.compare(rhs) == .orderedSame
}

public func <(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> Bool {
    return lhs.compare(rhs) == .orderedAscending
}

// MARK: - Arithmetic Operators

public prefix func -(value: NSDecimalNumber) -> NSDecimalNumber {
    return value.multiplying(by: NSDecimalNumber(mantissa: 1, exponent: 0, isNegative: true))
}

public func +(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.adding(rhs)
}

public func -(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.subtracting(rhs)
}

public func *(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.multiplying(by: rhs)
}

public func /(lhs: NSDecimalNumber, rhs: NSDecimalNumber) -> NSDecimalNumber {
    return lhs.dividing(by: rhs)
}

public func ^(lhs: NSDecimalNumber, rhs: Int) -> NSDecimalNumber {
    return lhs.raising(toPower: rhs)
}

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

func decimalValue(aNumber : NSNumber!) -> NSDecimalNumber {
    guard let val = aNumber as NSNumber? else {
        return NSDecimalNumber.zero
    }
    return NSDecimalNumber(decimal: val.decimalValue)
}
