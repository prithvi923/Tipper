//
//  PPSegmentedControl.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class PPSegmentedControl: UISegmentedControl {
    
    override init(items: [AnyObject]?) {
        super.init(items: items)
        
        backgroundColor = Constants.appGreenColor
        tintColor = UIColor.whiteColor()
        
        selectedSegmentIndex = NSUserDefaults.standardUserDefaults().integerForKey(Constants.defaultIndex)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
