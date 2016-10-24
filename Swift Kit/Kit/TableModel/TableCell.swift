//
//  TableCell.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 5/8/16.
//  Copyright © 2016 Koxaras. All rights reserved.
//

import UIKit

open class TableCell : UITableViewCell {
	var cellActions = CellActions()
	weak var ownerSection: TableSection?
    weak var ownerTableViewModel : TableModel? // Make read only
    
    var height : CGFloat?

    var boundObject : AnyObject?
    var boundPropertyName : String?
    var needsCommit = false
    var valueIsValid = true

    var boundValue : AnyObject? {
        get {
            if let obj = boundObject, let key = boundPropertyName {
                return obj.value(forKey: key) as AnyObject?
            }
            return nil
        }
        set {
            if let obj = boundObject, let key = boundPropertyName {
                obj.setValue(newValue, forKey: key)
            }
        }
    }

    func loadBoundValueIntoControl() {
        // override in subclasses
        
    }
    
    func commitChanges() {
        needsCommit = false
    }

	func didSelect() {
		// override in subclasses
	}
	
    override open func prepareForReuse() {
        super.prepareForReuse()
        
        needsCommit = false
        valueIsValid = true
        height = nil
        boundObject = nil
        boundPropertyName = nil
        ownerSection = nil
        ownerTableViewModel = nil
    }

}
