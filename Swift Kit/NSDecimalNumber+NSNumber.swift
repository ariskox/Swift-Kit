//
//  NSDecimalNumber+NSNumber.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

extension NSDecimalNumber {

    convenience init(_ number: NSNumber) {
        self.init(decimal: number.decimalValue)
    }
}
