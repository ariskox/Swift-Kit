//
//  UIImage+Colorized.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import UIKit

extension UIImage {

    func colorized(color: UIColor) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale)
        
        guard let ctx = UIGraphicsGetCurrentContext(), let cgimg = self.cgImage else {
            return nil
        }
        
        ctx.clip(to: rect, mask: cgimg)
        ctx.setFillColor(color.cgColor)
        ctx.fill(rect)
        
        var img : UIImage? = nil
        
        if let colorizedImage = UIGraphicsGetImageFromCurrentImageContext(),
            let cgImage = colorizedImage.cgImage {
            img = UIImage(cgImage: cgImage, scale: self.scale, orientation: .downMirrored)
        }
        
        UIGraphicsEndImageContext()

        return img
    }
}
