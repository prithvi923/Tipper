//
//  PPLabelView.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/12/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class PPLabelView: UIView {
    
    var viewLabel: PPLabel!
    var amountLabel: PPLabel!

    init(name: String) {
        super.init(frame: CGRect())
        
        backgroundColor = Constants.appLightGreenColor
        
        amountLabel = PPLabel(title: "$0.00", fontSize: 30.0)
        addSubview(amountLabel)
        positionAmountLabel()
        
        viewLabel = PPLabel(title: name, fontSize: 15.0)
        viewLabel.textAlignment = NSTextAlignment.Left
        addSubview(viewLabel)
        positionViewLabel()
    }
    
    func positionViewLabel() {
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        viewLabel.topAnchor.constraintEqualToAnchor(topAnchor).active = true
        viewLabel.bottomAnchor.constraintEqualToAnchor(amountLabel.topAnchor).active = true
        viewLabel.leftAnchor.constraintEqualToAnchor(leftAnchor, constant: 10).active = true
        viewLabel.rightAnchor.constraintEqualToAnchor(rightAnchor).active = true
    }
    
    func positionAmountLabel() {
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.centerYAnchor.constraintEqualToAnchor(centerYAnchor).active = true
        amountLabel.rightAnchor.constraintEqualToAnchor(rightAnchor).active = true
        amountLabel.leftAnchor.constraintEqualToAnchor(leftAnchor).active = true
        amountLabel.heightAnchor.constraintEqualToConstant(35).active = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
