//
//  SettingsViewController.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/12/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var settingsTipControl: PPSegmentedControl!
    var tipControlLabel: PPLabel!
    var settingsView: UIView!
    var viewWidth: CGFloat!
    var navigationHeight: CGFloat!
    
    override func viewDidLoad() {
        title = "Settings"
        view.backgroundColor = UIColor.whiteColor()
        navigationHeight = navigationController?.navigationBar.frame.height
        viewWidth = view.frame.width
        
        settingsView = UIView()
        settingsView.backgroundColor = Constants.appGreenColor
        view.addSubview(settingsView)
        positionSettingsView()
        
        settingsTipControl = PPSegmentedControl(items: Constants.tipValues)
        settingsTipControl.addTarget(self, action: #selector(updateDefaultTip), forControlEvents: .ValueChanged)
        view.addSubview(settingsTipControl)
        positionTipControl()
        
        tipControlLabel = PPLabel(title: "Default Tip", fontSize: 15.0)
        tipControlLabel.textAlignment = NSTextAlignment.Left
        view.addSubview(tipControlLabel)
        positionTipControlLabel()
    }
    
    func updateDefaultTip() {
        let defaults = NSUserDefaults.standardUserDefaults()
        let newDefaultIndex = settingsTipControl.selectedSegmentIndex
        
        defaults.setInteger(newDefaultIndex, forKey: Constants.defaultIndex)
        defaults.synchronize()
    }
    
    func positionSettingsView() {
        settingsView.translatesAutoresizingMaskIntoConstraints = false
        settingsView.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: navigationHeight + 20).active = true
        settingsView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor).active = true
        settingsView.rightAnchor.constraintEqualToAnchor(view.rightAnchor).active = true
        settingsView.leftAnchor.constraintEqualToAnchor(view.leftAnchor).active = true
    }
    
    func positionTipControl() {
        settingsTipControl.translatesAutoresizingMaskIntoConstraints = false
        settingsTipControl.widthAnchor.constraintEqualToConstant(viewWidth*7/9).active = true
        settingsTipControl.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor, constant: 0).active = true
        settingsTipControl.topAnchor.constraintEqualToAnchor(view.topAnchor, constant: 70 + navigationHeight!).active = true
        settingsTipControl.heightAnchor.constraintEqualToConstant(25).active = true
    }
    
    func positionTipControlLabel() {
        tipControlLabel.translatesAutoresizingMaskIntoConstraints = false
        tipControlLabel.bottomAnchor.constraintEqualToAnchor(settingsTipControl.topAnchor, constant: -5).active = true
        tipControlLabel.widthAnchor.constraintEqualToAnchor(settingsTipControl.widthAnchor).active = true
        tipControlLabel.heightAnchor.constraintEqualToConstant(20).active = true
        tipControlLabel.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor, constant: 0).active = true
    }
}
