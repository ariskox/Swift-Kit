//
//  PickerModel.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 5/8/16.
//  Copyright © 2016 Koxaras. All rights reserved.
//

import UIKit

struct PickerHelper<T> {
	let items : [[T]]
	let configureView : (_ item: T, _ view: UIView?) -> UIView
    let didSelect : (_ items: [T], _ component : Int) -> Void
}

class PickerModel<T>: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
	fileprivate let helper : PickerHelper<T>
	fileprivate let pickerView : UIPickerView
	
	required init(pickerView: UIPickerView, helper: PickerHelper<T>, selectedIndexes : [Int]? = nil) {
		self.helper = helper
		self.pickerView = pickerView
        
		super.init()
		
		self.pickerView.delegate = self
		self.pickerView.dataSource = self
		
		if let selectedIndexes = selectedIndexes {
			selectItemsAtIndexes(selectedIndexes, animated: false)
		}
	}
	
	func selectItemsAtIndexes(_ indexes : [Int], animated: Bool) {
		assert(indexes.count <= helper.items.count)
		for i in 0 ..< indexes.count {
			pickerView.selectRow(indexes[i], inComponent: i, animated: animated)
		}
	}
	
	// MARK: UIPickerViewDataSource
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return helper.items.count
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return helper.items[component].count
	}
	
	// MARK: UIPickerViewDelegate
	
	func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
		return pickerView.bounds.width / CGFloat(helper.items.count)
	}
	
	func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
		return 44
	}
	
	func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
		
		return helper.configureView(helper.items[component][row], view)
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		
        let selectedItems = helper.items.enumerated().map { (index, element) in
            element[pickerView.selectedRow(inComponent: index)]
        }
        
        helper.didSelect(selectedItems, component)
	}
}
