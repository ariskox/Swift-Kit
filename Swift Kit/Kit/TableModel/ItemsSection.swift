//
//  ItemsSection.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 5/8/16.
//  Copyright © 2016 Koxaras. All rights reserved.
//

import UIKit

class ItemsSection<Item : AnyObject> : TableSection {
    var cellActions = CellActions()
    var sectionActions = SectionActions()
    var headerView : UIView?
    var footerView : UIView?
    var headerHeight : CGFloat?
    var footerHeight : CGFloat?
    
    fileprivate var items : [Item] = []
    weak var ownerModel: TableModel?
    
    convenience init(items : [Item]?) {
        self.init()
        if let items = items {
            self.items = items
        }
    }
    
    func cellCount() -> Int {
        return items.count
    }
    
    func cellAtIndexPath(_ indexPath: IndexPath) -> TableCell {
        
        if let createAction = sectionActions.createCell {
            
            let item = items[(indexPath as NSIndexPath).row]
            let cell = createAction(item, indexPath)
            
            cell.ownerSection = self
            cell.boundObject = item
            
            configureCustomButtons(cell)
            
            if let configureAction = sectionActions.configureCell {
                configureAction(cell, item, indexPath)
                cell.loadBoundValueIntoControl()
                return cell
            }
        }
        
        fatalError("Please configure sectionActions.createCell & sectionActions.configureCell")
        
        return TableCell() // How can this warning be silenced ?
    }
    
    func addItem(_ item: Item) -> Item {
        items.append(item)
        return item
    }
    
    func addItems(_ newItems: [Item]) -> [Item] {
        items.append(contentsOf: newItems)
        return newItems
    }
    
    func didSelectCellAtIndexPath(_ cell: TableCell, indexPath: IndexPath) {
        
        if let didSelectAction = cellActions.didSelect {
            didSelectAction(cell, indexPath)
        }
    }
    
    func heightForRowAtIndexPath(_ indexPath: IndexPath) -> CGFloat {
        let cell = cellAtIndexPath(indexPath)
        
        let customHeight = ownerModel?.modeledTableView?.rowHeight ?? 44
        return cell.height ?? customHeight
    }
    
    // MARK: Custom Buttons
    
    func configureCustomButtons(_ cell: TableCell) {
        for button in cell.contentView.subviews.flatMap({$0 as? UIButton}) {
            button.addTarget(self, action: #selector(didTapCustomButton(_:)), for: .touchUpInside)
        }
    }
    
    @objc func didTapCustomButton(_ sender: UIButton) {
        
        if let didTapCustomButton = cellActions.didTapCustomButton,
            let cell = sender.superview?.superview as? TableCell {
            didTapCustomButton(cell, sender)
        }
    }
}
