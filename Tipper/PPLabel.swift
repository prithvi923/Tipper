//
//  PPLabel.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class PPLabel: UILabel {
    
    init(title: String, fontSize: CGFloat) {
        super.init(frame: CGRect())
        
        text = title
        backgroundColor = UIColor.clearColor()
        textAlignment = NSTextAlignment.Right
        textColor = UIColor.whiteColor()
        font = UIFont(name: "Futura", size: fontSize)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
