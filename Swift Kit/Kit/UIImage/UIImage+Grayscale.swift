//
//  UIImage+Grayscale.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 20/02/2017.
//  Copyright © 2017 Aris Koxaras. All rights reserved.
//

import UIKit

extension UIImage {
    
    func grayScaled() -> UIImage? {
        
        let scale = UIScreen.main.scale
        let rect = CGRect(x: 0,
                          y: 0,
                          width: self.size.width * scale,
                          height: self.size.height * scale)
        
        let colorSpace = CGColorSpaceCreateDeviceGray()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue).rawValue
        let context = CGContext(data: nil,
                                width: Int(rect.size.width),
                                height: Int(rect.size.height),
                                bitsPerComponent: 8,
                                bytesPerRow: 0,
                                space: colorSpace,
                                bitmapInfo: bitmapInfo)
        
        guard let cgImage = self.cgImage, context != nil else {
            return nil
        }
        
        context!.draw(cgImage, in: rect)

        guard let imgRect = context!.makeImage() else {
            return nil
        }
        
        return UIImage(cgImage: imgRect, scale: scale, orientation: .up)
    }
    
}
