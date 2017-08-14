//
//  UIView+UIImage.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 24/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
        Returns the contents of the view as a UIImage. Useful for creating complex view
     */

    func getImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        self.layer.render(in: context)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
}
