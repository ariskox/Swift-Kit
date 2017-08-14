//
//  Alamofire+Debug.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 24/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

//import Alamofire

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
            debugPrint(self)
        #endif
        return self
    }
}
