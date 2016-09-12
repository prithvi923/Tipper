//
//  PPLabel.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class PPLabel: UILabel {
    
    init() {
        super.init(frame: CGRect())
        
        backgroundColor = Constants.appLightGreenColor
        textAlignment = NSTextAlignment.Right
        textColor = UIColor.whiteColor()
        font = UIFont(name: "Futura", size: 30.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
