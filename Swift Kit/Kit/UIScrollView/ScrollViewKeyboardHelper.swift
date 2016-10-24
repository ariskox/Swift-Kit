//
//  ScrollViewKeyboardHelper.swift
//  Swift Kit
//
//  This class will automatically set the bottom inset 
//  of a scrollView (or tableView) when the keyboard appears or hides.
//
//  Initialize it in your viewDidLoad and set keep it as a property
//
//  Created by Aris Koxaras on 22/10/16.
//  Copyright © 2016 Aris Koxaras. All rights reserved.
//

import UIKit

class ScrollViewKeyboardHelper {
    
    private(set) weak var view : UIView?
    private(set) weak var scrollView : UIScrollView?
    private(set) var keyboardIsVisible = false
    
    required init(view : UIView, scrollView: UIScrollView) {
        self.view = view
        self.scrollView = scrollView
    }
    
    func viewWillAppear() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShowNotification), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHideNotification), name: .UIKeyboardWillHide, object: nil)
    }
    
    func viewWillDisappear() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - Notifications
    
    @objc func keyboardWillShowNotification(notification: NSNotification) {
        keyboardIsVisible = true
        
        guard let keybNotification = try? KeyboardNotification(notification: notification),
            let scrollView = scrollView,
            let view = view else {
                return
        }
        
        let overlapHeight = scrollView.frame.maxY - keybNotification.convertedKeyboardEndFrame(view: view).minY
        scrollView.contentInset.bottom = overlapHeight
        scrollView.scrollIndicatorInsets.bottom = overlapHeight
    }
    
    @objc func keyboardWillHideNotification(notification: NSNotification) {
        keyboardIsVisible = false
        
        scrollView?.contentInset.bottom = 0
        scrollView?.scrollIndicatorInsets.bottom = 0
    }

}

