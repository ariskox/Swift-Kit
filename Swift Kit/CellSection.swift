//
//  CellSection.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 5/8/16.
//  Copyright © 2016 Koxaras. All rights reserved.
//

import UIKit

class CellSection : TableSection {
    
    var cellActions = CellActions()
    
    weak var ownerModel: TableModel? {
        didSet {
            cells.forEach({$0.ownerSection = self})
        }
    }
    var headerView : UIView?
    var footerView : UIView?
    var headerHeight : CGFloat?
    var footerHeight : CGFloat?
    
    fileprivate var cells : [TableCell] = []
    
    convenience init(cells : [TableCell]) {
        self.init()
        self.cells = cells
    }
    
    func cellCount() -> Int {
        return cells.count
    }
    
    func cellAtIndexPath(_ indexPath: IndexPath) -> TableCell {
        return cells[(indexPath as NSIndexPath).row]
    }
    
    func addCell(_ cell: TableCell) -> TableCell {
        cells.append(cell)
        cell.ownerSection = self
        cell.ownerTableViewModel = self.ownerModel
        cell.loadBoundValueIntoControl()
        return cell
    }
    
    func didSelectCellAtIndexPath(_ cell: TableCell, indexPath: IndexPath) {
        
        let cell = cellAtIndexPath(indexPath)
        
        if let didSelectAction = cellActions.didSelect {
            didSelectAction(cell, indexPath)
        } else if let didSelectAction = cells[(indexPath as NSIndexPath).row].cellActions.didSelect {
            didSelectAction(cell, indexPath)
        }
    }
    
    func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        let cell = cellAtIndexPath(indexPath)
        return cell.height ?? 44
    }
    
}
