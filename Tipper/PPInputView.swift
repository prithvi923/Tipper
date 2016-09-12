//
//  PPInputView.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class PPInputView: UIView {
    var tipControl: PPSegmentedControl!
    
    init(viewWidth: CGFloat) {
        super.init(frame: CGRect())
        
        backgroundColor = Constants.appGreenColor
        
        tipControl = PPSegmentedControl(items: Constants.tipValues)
        self.addSubview(tipControl)
        
        addTipControlConstraints(viewWidth)
    }
    
    func addTipControlConstraints(viewWidth: CGFloat) {
        tipControl.translatesAutoresizingMaskIntoConstraints = false
        tipControl.widthAnchor.constraintEqualToConstant(viewWidth*7/9).active = true
        tipControl.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor, constant: 0).active = true
        tipControl.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor, constant: -10).active = true
        tipControl.heightAnchor.constraintEqualToConstant(25).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
