//
//  Array+find.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

extension Array {
    
    func find(includedElement: (Element) -> Bool) -> Int? {
        for (idx, element) in self.enumerated() {
            if includedElement(element) {
                return idx
            }
        }
        return nil
    }
}

extension Array where Element : Equatable {

    func find(element: Element) -> Int? {
        return find(includedElement: { $0 == element })
    }
    
}
