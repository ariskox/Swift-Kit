//
//  TableActions.swift
//  Swift Kit
//
//  Created by Aris Koxaras on 5/8/16.
//  Copyright © 2016 Koxaras. All rights reserved.
//

import UIKit

struct TableActions {
    var didScrollAction : ((_ scrollView: UIScrollView)->Void)? = nil
}

struct SectionActions {
    var createCell : ((AnyObject, IndexPath) -> TableCell)? = nil
    var configureCell : ((TableCell, AnyObject, IndexPath) -> Void)? = nil
}

struct CellActions {
    var didSelect : ((TableCell, IndexPath) -> Void)? = nil
    var valueChanged : ((TableCell, IndexPath) -> Void)? = nil
    var didTapCustomButton : ((TableCell, UIButton) -> Void)? = nil
}

