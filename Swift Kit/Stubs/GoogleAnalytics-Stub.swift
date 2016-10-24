//
//  GoogleAnalytics-Stub.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 24/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import Foundation

let kGAIScreenName: String = "test"
let kGAIDescription: String = "test"

let stubMsg = "Do not link this class in your project"

class GAITracker {
    
    init() {
        fatalError(stubMsg)
    }
    
    func send(_ a: [NSObject : AnyObject]) {
    }
    
    func set(_ val: String, value: String) {
    }
}

class GAI {
    var defaultTracker: GAITracker?
    
    init() {
        fatalError(stubMsg)
    }

    class func sharedInstance() -> GAI {
        return GAI()
    }
}

class GAIDictionaryBuilder {
    
    init() {
        fatalError(stubMsg)
    }

    class func createTransactionWithId(_ transactionId: String?, affiliation: String?, revenue: NSNumber?, tax: NSNumber?, shipping: NSNumber?, currencyCode: String?) -> GAITransaction {
        return GAITransaction()
    }
    
    class func createItemWithTransactionId(_ transId: String?, name: String?, sku: String?, category: String?, price: NSNumber?, quantity: Int?, currencyCode: String?) -> GAIItem {
        return GAIItem()
    }
    
    class func createScreenView() -> GAIScreenView {
        return GAIScreenView()
    }
    
    class func createEventWithCategory(_ category: String?, action: String?, label: String?, value: NSNumber?) -> GAIEvent {
        return GAIEvent()
    }
}

class GAITransaction {
    
    init() {
        fatalError(stubMsg)
    }

    func set(_ val: String, forKey: String) -> GAITransaction {
        return self
    }
    
    func build() -> NSDictionary {
        return NSDictionary()
    }
}

class GAIScreenView {
    
    init() {
        fatalError(stubMsg)
    }

    func set(_ val: String, forKey: String) -> GAIScreenView {
        return self
    }
    
    func build() -> NSDictionary? {
        return NSDictionary()
    }
}

class GAIEvent {
    
    init() {
        fatalError(stubMsg)
    }

    func build() -> NSDictionary? {
        return NSDictionary()
    }
}

class GAIItem {
    
    init() {
        fatalError(stubMsg)
    }

    func build() -> NSDictionary {
        return NSDictionary()
    }
}
