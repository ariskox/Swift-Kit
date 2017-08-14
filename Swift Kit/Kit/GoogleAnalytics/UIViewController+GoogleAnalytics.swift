//
//  UIViewController+GoogleAnalytics.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 24/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func logGoogleAnalytics(category: String, product: String, orderId: String?, SKU : String, price: NSNumber, appViewName: String? ) {
        
        guard let tracker = GAI.sharedInstance().defaultTracker else {
            debugPrint("Could not find tracker")
            return
        }
        
        let categoryName = category
        let productName = product
        let productSKU = SKU
        let quantity = 1
        let productPrice = price
        let totalPrice = productPrice
        
        if let appViewName = appViewName {
            logGoogleAnalyticsAppView(appViewName)
        }
        
        let dummyOrderId = NSString(format: "%.0f.%d", NSDate().timeIntervalSince1970, arc4random()%1000) as String
        let orderIdNonNull: String = orderId ?? dummyOrderId
        
        let prodParams = GAIDictionaryBuilder.createTransactionWithId(
            orderIdNonNull,
            affiliation: "",//VVDynamicSettingsManager.sharedManager().channelId,
            revenue: totalPrice,
            tax: 0,
            shipping: 0,
            currencyCode: "EUR")
        
        tracker.send(prodParams.build() as [NSObject : AnyObject])
        
        let transParams = GAIDictionaryBuilder.createItemWithTransactionId(
            orderIdNonNull,
            name: productName,
            sku: productSKU,
            category: categoryName,
            price: productPrice,
            quantity: quantity,
            currencyCode: "EUR")
        
        tracker.send(transParams.build() as [NSObject : AnyObject])
        
    }
    
    func logGoogleAnalyticsAppView(_ appViewName: String) {
        
        guard let tracker = GAI.sharedInstance().defaultTracker, let f = GAIDictionaryBuilder.createScreenView().set(appViewName, forKey: kGAIScreenName).build() else {
            
            debugPrint("Could not find tracker")
            return
        }
        
        tracker.set(kGAIDescription, value: appViewName)
        tracker.send(f as [NSObject : AnyObject])
    }
    
    func logGoogleAnalyticsEvent(category: String?, action: String?, label: String?, value: NSNumber?) {
        
        guard let tracker = GAI.sharedInstance().defaultTracker, let f = GAIDictionaryBuilder.createEventWithCategory(category, action: action, label: label, value: value).build() else {
            
            debugPrint("Could not find tracker")
            return
        }
        
        tracker.send(f as [NSObject : AnyObject])
    }
    
}
