//
//  ViewController.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var baseField: UITextField!
    var tipLabel: UILabel!
    var totalLabel: UILabel!
    var tipControl: UISegmentedControl!
    var tipValues: [String] = ["15%", "20%", "25%"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createInputBaseField()
        createTipLabel()
        createTotalLabel()
        createTipControl()
    }
    
    func createInputBaseField() {
        baseField = UITextField()
        
        baseField.backgroundColor = UIColor.greenColor()
        
        baseField.addTarget(self, action: #selector(changeTip), forControlEvents: .EditingChanged)
        
        baseField.keyboardType = UIKeyboardType.DecimalPad
        
        baseField.placeholder = "$"
        
        baseField.textAlignment = NSTextAlignment.Right
        
        view.addSubview(baseField)
        
        baseField.translatesAutoresizingMaskIntoConstraints = false
        baseField.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
        baseField.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
        baseField.widthAnchor.constraintEqualToConstant(view.frame.width/2).active = true
        baseField.heightAnchor.constraintEqualToConstant(50).active = true
        
        baseField.becomeFirstResponder()
    }
    
    func createTipLabel() {
        tipLabel = UILabel()
        
        tipLabel.backgroundColor = UIColor.cyanColor()
        
        view.addSubview(tipLabel)
        
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        tipLabel.topAnchor.constraintEqualToAnchor(baseField.bottomAnchor, constant: 50).active = true
        tipLabel.widthAnchor.constraintEqualToConstant(view.frame.width/2).active = true
        tipLabel.heightAnchor.constraintEqualToConstant(50).active = true
        tipLabel.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
    }
    
    func createTotalLabel() {
        totalLabel = UILabel()
        
        totalLabel.backgroundColor = UIColor.magentaColor()
        
        view.addSubview(totalLabel)
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.topAnchor.constraintEqualToAnchor(tipLabel.bottomAnchor, constant: 50).active = true
        totalLabel.widthAnchor.constraintEqualToConstant(view.frame.width/2).active = true
        totalLabel.heightAnchor.constraintEqualToConstant(50).active = true
        totalLabel.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
    }
    
    func createTipControl() {
        tipControl = UISegmentedControl(items: tipValues)
        
        tipControl.selectedSegmentIndex = 1
        
        tipControl.addTarget(self, action: #selector(changeTip), forControlEvents: .ValueChanged)
        
        view.addSubview(tipControl)
        
        tipControl.translatesAutoresizingMaskIntoConstraints = false
        tipControl.topAnchor.constraintEqualToAnchor(totalLabel.bottomAnchor, constant: 50).active = true
        tipControl.widthAnchor.constraintEqualToConstant(view.frame.width*7/9).active = true
        tipControl.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor, constant: 0).active = true
//        tipControl.heightAnchor.constraintEqualToConstant(50).active = true
    }
    
    func changeTip() {
        let base = Double(baseField.text!) ?? 0
        
        let tipInts = [0.15, 0.20, 0.25]
        
        let tipPerc = tipInts[tipControl.selectedSegmentIndex]
        
        let tip = tipPerc*base
        let total = tip+base
        
        tipLabel.text = String.localizedStringWithFormat("$%.2f", tip)
        totalLabel.text = String.localizedStringWithFormat("$%.2f", total)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

