//
//  UIImage+Color.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import UIKit

extension UIImage {
    
    /**
     Returns an image of 'size' filled with the specified 'color'
     */

    class func with(color: UIColor, size: CGSize) -> UIImage? {
        
        UIGraphicsBeginImageContext(size)
        
        guard let ctx = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        ctx.setFillColor(color.cgColor)
        ctx.fill(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
