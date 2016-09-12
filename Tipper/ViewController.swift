//
//  ViewController.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var baseView: UIView!
    var baseField: UITextField!
    var tipLabel: UILabel!
    var totalLabel: UILabel!
    var tipControl: UISegmentedControl!
    var tipValues: [String] = ["15%", "20%", "25%"]
    var keyboardHeight: CGFloat!
    var viewableArea: CGFloat!
    var baseViewConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        createBaseView()
        createTipLabel()
        createTotalLabel()
    }
    
    func createBaseView() {
        baseView = UIView()
        
        baseView.backgroundColor = Constants.appGreenColor
        
        createInputBaseField()
        createTipControl()
        
        view.addSubview(baseView)
        
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
        baseView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
        baseView.widthAnchor.constraintEqualToConstant(view.frame.width).active = true
    }
    
    func createInputBaseField() {
        baseField = UITextField()
        
        baseField.backgroundColor = Constants.appGreenColor
        baseField.textColor = UIColor.whiteColor()
        baseField.font = UIFont(name: "Futura", size: 30.0)
        baseField.textAlignment = NSTextAlignment.Right
        
        baseField.addTarget(self, action: #selector(changeTip), forControlEvents: .EditingChanged)
        
        baseField.keyboardType = UIKeyboardType.DecimalPad
        
        baseField.placeholder = "$"
        
        baseView.addSubview(baseField)
        
        baseField.translatesAutoresizingMaskIntoConstraints = false
        baseField.widthAnchor.constraintEqualToConstant(baseView.frame.width).active = true
        baseField.heightAnchor.constraintEqualToConstant(30)
        baseField.rightAnchor.constraintEqualToAnchor(baseView.rightAnchor, constant: 0).active = true
        baseField.centerXAnchor.constraintEqualToAnchor(baseView.centerXAnchor).active = true
        baseField.centerYAnchor.constraintEqualToAnchor(baseView.centerYAnchor).active = true
        
        baseField.becomeFirstResponder()
    }
    
    func createTipLabel() {
        tipLabel = UILabel()
        
        tipLabel.backgroundColor = Constants.appLightGreenColor
        tipLabel.textAlignment = NSTextAlignment.Right
        tipLabel.textColor = UIColor.whiteColor()
        tipLabel.font = UIFont(name: "Futura", size: 30.0)
        
        view.addSubview(tipLabel)
        
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        tipLabel.topAnchor.constraintEqualToAnchor(baseView.bottomAnchor, constant: 0).active = true
        tipLabel.widthAnchor.constraintEqualToConstant(view.frame.width).active = true
        tipLabel.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
    }
    
    func createTotalLabel() {
        totalLabel = UILabel()
        
        totalLabel.backgroundColor = Constants.appLightGreenColor
        totalLabel.textAlignment = NSTextAlignment.Right
        totalLabel.textColor = UIColor.whiteColor()
        totalLabel.font = UIFont(name: "Futura", size: 30.0)
        
        view.addSubview(totalLabel)
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.topAnchor.constraintEqualToAnchor(tipLabel.bottomAnchor, constant: 0).active = true
        totalLabel.widthAnchor.constraintEqualToConstant(view.frame.width).active = true
        totalLabel.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
    }
    
    func createTipControl() {
        tipControl = UISegmentedControl(items: tipValues)
        
        tipControl.selectedSegmentIndex = 1
        tipControl.backgroundColor = Constants.appGreenColor
        tipControl.tintColor = UIColor.whiteColor()
        
        tipControl.addTarget(self, action: #selector(changeTip), forControlEvents: .ValueChanged)
        
        baseView.addSubview(tipControl)
        
        tipControl.translatesAutoresizingMaskIntoConstraints = false
        tipControl.widthAnchor.constraintEqualToConstant(view.frame.width*7/9).active = true
        tipControl.centerXAnchor.constraintEqualToAnchor(baseView.centerXAnchor, constant: 0).active = true
        tipControl.bottomAnchor.constraintEqualToAnchor(baseView.bottomAnchor, constant: -10).active = true
        tipControl.heightAnchor.constraintEqualToConstant(25).active = true
    }
    
    func changeTip() {
        if baseField.text != "" {
            baseViewConstraint.constant = viewableArea/2
        } else {
            baseViewConstraint.constant = viewableArea
        }
        
        UIView.animateWithDuration(0.25) {
            self.view.layoutIfNeeded()
        }
        
        let base = Double(baseField.text!) ?? 0
        
        let tipInts = [0.15, 0.20, 0.25]
        
        let tipPerc = tipInts[tipControl.selectedSegmentIndex]
        
        let tip = tipPerc*base
        let total = tip+base
        
        tipLabel.text = String.localizedStringWithFormat("+ $%.2f", tip)
        totalLabel.text = String.localizedStringWithFormat("= $%.2f", total)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        keyboardHeight = frame.height
        
        viewableArea = view.frame.height - keyboardHeight - 20
        
        baseViewConstraint = baseView.heightAnchor.constraintEqualToConstant(viewableArea)
        baseViewConstraint.active = true
        tipLabel.heightAnchor.constraintEqualToConstant(viewableArea/4).active = true
        totalLabel.heightAnchor.constraintEqualToConstant(viewableArea/4).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

