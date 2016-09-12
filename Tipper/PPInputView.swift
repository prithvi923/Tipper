//
//  PPInputView.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class PPInputView: UIView {
    init(frame: CGRect, parentView: UIView) {
        super.init(frame: frame)
        
        backgroundColor = Constants.appGreenColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
