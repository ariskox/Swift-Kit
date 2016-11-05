//
//  UIImage+Combine.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 21/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import UIKit

extension UIImage {

    /**
       Draws an image on top of the current image
     
     - Parameter image: the image to draw on top
     - Parameter drawnInRect: the rectange to draw into
     
     - Returns: A new image with the two images combined
     */

    func combinedWith(image: UIImage, drawnInRect: CGRect) -> UIImage? {

        let rect = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, self.scale)

        self.draw(at: CGPoint.zero)
        image.draw(in: rect)
    
        let combinedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return combinedImage
    }
}
