//
//  String+Nil.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

protocol OptionalString {}
extension String: OptionalString {}

extension Optional where Wrapped: OptionalString {
    
    /**
        Returns true if the optional String is nil or empty
     */

    var isNilOrEmpty: Bool {
        return ((self as? String) ?? "").isEmpty
    }
}
