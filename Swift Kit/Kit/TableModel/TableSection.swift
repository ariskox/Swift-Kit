//
//  TableSection.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 5/8/16.
//  Copyright © 2016 Koxaras. All rights reserved.
//

import UIKit

protocol TableSection : class {
    
    weak var ownerModel : TableModel? {get set}
    var headerView : UIView? {get set}
    var footerView : UIView? {get set}
	func cellCount() -> Int
	func cellAtIndexPath(_ indexPath: IndexPath) -> TableCell
	func didSelectCellAtIndexPath(_ cell: TableCell, indexPath: IndexPath)
    func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat
    
    var headerHeight : CGFloat? {get set}
    var footerHeight : CGFloat? {get set}
	
}

