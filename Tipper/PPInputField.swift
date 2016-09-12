//
//  PPInputField.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class PPInputField: UITextField {

    init() {
        super.init(frame: CGRect())
        
        backgroundColor = Constants.appGreenColor
        textColor = UIColor.whiteColor()
        font = UIFont(name: "Futura", size: 30.0)
        textAlignment = NSTextAlignment.Right
        keyboardType = UIKeyboardType.DecimalPad
        placeholder = "$"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
