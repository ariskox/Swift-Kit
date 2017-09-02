//
//  NSAttributedString+Size.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 02/09/2017.
//  Copyright © 2017 Aris Koxaras. All rights reserved.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    func sizeForTargetSize(_ size: CGSize) -> CGSize {
        var rect = self.boundingRect(with: size,
                                     options: [.usesFontLeading, .usesLineFragmentOrigin],
                                     context: nil)
        
        rect.size.width = ceil(rect.size.width)
        rect.size.height = ceil(rect.size.height)
        
        return rect.size
    }
    
}
