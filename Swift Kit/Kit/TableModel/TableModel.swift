//
//  TableModel.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 5/8/16.
//  Copyright © 2016 Koxaras. All rights reserved.
//

import UIKit

class TableModel: NSObject, UITableViewDelegate, UITableViewDataSource {
    
	var autoDeselect = true
    let tableActions : TableActions
    
    fileprivate(set) weak var modeledTableView : UITableView? // Make read only
    fileprivate var sections : [TableSection] = []

    var tableView : UITableView? {
        get {
            return modeledTableView
        }
        set {
            modeledTableView = newValue
            tableView?.delegate = self
            tableView?.dataSource = self

        }
    }
    
	// MARK: - Public Functions
	
    required init(tableView: UITableView, sections: [TableSection], actions: TableActions = TableActions()) {
        
        self.tableActions = actions
        super.init()

        sections.forEach {addSection($0) }
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    func addSection(_ section: TableSection) {
		section.ownerModel = self
		sections.append(section)
	}
	
    // MARK: - Helpers
    
    func computeSizeForView(_ view : UIView, tableView: UITableView) -> CGSize {
        let width = tableView.bounds.size.width
        
        let widthConstraint = NSLayoutConstraint(
            item: view,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1.0,
            constant: width)
        
        view.addConstraint(widthConstraint)
        view.translatesAutoresizingMaskIntoConstraints = false
        let size = view.systemLayoutSizeFitting(UILayoutFittingCompressedSize)
        view.removeConstraint(widthConstraint)
        view.translatesAutoresizingMaskIntoConstraints = true
        view.frame = CGRect(x: view.frame.origin.x, y: view.frame.origin.y, width: width, height: size.height)
        view.layoutIfNeeded()
        
        return size
    }

	// MARK: - UITableViewDataSource
    
	func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].cellCount()
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let s = sections[(indexPath as NSIndexPath).section]
		return s.cellAtIndexPath(indexPath) as UITableViewCell
	}
    
	// MARK: - UITableViewDelegate
    
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableCell
		
		cell.didSelect()
		
		sections[(indexPath as NSIndexPath).section].didSelectCellAtIndexPath(cell, indexPath: indexPath)
        
        if autoDeselect {
            tableView.deselectRow(at: indexPath, animated: true)
        }
	}

    // MARK: Headers & Footers

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let s = sections[section]
        return s.headerView
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let s = sections[section]
        return s.footerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let s = sections[section]
        if let view = s.headerView {
            return computeSizeForView(view, tableView: modeledTableView!).height
        }
        return s.headerHeight ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let s = sections[section]
        if let view = s.footerView {
            return computeSizeForView(view, tableView: modeledTableView!).height
        }
        return s.footerHeight ?? 0
    }

    // MARK: TableCell Height
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return sections[(indexPath as NSIndexPath).section].heightForRowAtIndexPath(indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return (tableView.estimatedRowHeight == 0) ? tableView.rowHeight : tableView.estimatedRowHeight
    }
	
	// MARK: UIScrollViewDelegate
	
	func scrollViewDidScroll(_ scrollView: UIScrollView) {
        tableActions.didScrollAction?(scrollView)
	}
}
