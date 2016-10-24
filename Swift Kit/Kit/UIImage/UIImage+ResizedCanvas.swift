//
//  UIImage+ResizedCanvas.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import UIKit

struct Gravity {
    
    enum GravityX : CGFloat {
        case Left = -1
        case Center = 0
        case Right = 1
    }
    
    enum GravityY : CGFloat {
        case Top = -1
        case Center = 0
        case Down = 1
    }

    let x: GravityX
    let y: GravityY
}

extension UIImage {

    func resizedTo(size: CGSize, gravity: Gravity) -> UIImage? {
        
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)

        let additionalSize = CGSize(width: (size.width - self.size.width)/2.0,
                                    height: (size.height - self.size.height)/2.0)
        
        let drawPoint = CGPoint(x: additionalSize.width * (1.0 + gravity.x.rawValue),
                                y: additionalSize.height * (1.0 + gravity.y.rawValue))
        
        self.draw(at: drawPoint)
        
        let resizeImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizeImage
    }

}
