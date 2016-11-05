//
//  Array+find.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

extension Array {
    
    /**
     Finds the position of an element that satisfies a condition
     
     - Parameter includedElement: A closure that taks an element of the array as its argument
       and returns a Boolean value indicating if this is the element we are looking for
     - Returns: The index of the element, or nil if the element was not found
     */

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

    /**
     Finds the position of an element
     
     - Parameter element: The element to search for
     
     - Returns: The index of the element, or nil if the element was not found
     */

    func find(element: Element) -> Int? {
        return find(includedElement: { $0 == element })
    }
    
}
