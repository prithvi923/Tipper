//
//  ViewController.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {

    var ppInputView: PPInputView!
    var tipLabelView: PPLabelView!
    var totalLabelView: PPLabelView!
    var keyboardHeight: CGFloat!
    var viewableArea: CGFloat!
    var baseViewConstraint: NSLayoutConstraint!
    var currencySymbol: String!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Tipper"
        currencySymbol = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        useDefaults()
        changeTip()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        
        setupBaseView()
        setupTipLabel()
        setupTotalLabel()
    }
    
    func useDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        ppInputView.tipControl.selectedSegmentIndex = defaults.integerForKey(Constants.defaultIndex)
        let currentDate = NSDate.timeIntervalSinceReferenceDate()
        if (defaults.objectForKey(Constants.lastActiveDate) != nil) {
            let lastActiveDate = defaults.doubleForKey(Constants.lastActiveDate)
            let lastActiveBill = defaults.doubleForKey(Constants.lastActiveBill)
            
            let tenMinutes = 600.00
            if currentDate <= lastActiveDate.advancedBy(tenMinutes) {
                ppInputView.inputField.text = String.localizedStringWithFormat("%.2f", lastActiveBill)
            }
        }
    }
    
    func setupBaseView() {
        ppInputView = PPInputView(viewWidth: view.frame.width, currency: currencySymbol)
        
        view.addSubview(ppInputView)
        
        ppInputView.translatesAutoresizingMaskIntoConstraints = false
        ppInputView.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
        ppInputView.topAnchor.constraintEqualToAnchor(topLayoutGuide.bottomAnchor).active = true
        ppInputView.widthAnchor.constraintEqualToConstant(view.frame.width).active = true
        
        ppInputView.tipControl.addTarget(self, action: #selector(changeTip), forControlEvents: .ValueChanged)
        ppInputView.inputField.addTarget(self, action: #selector(changeTip), forControlEvents: .EditingChanged)
        ppInputView.inputField.becomeFirstResponder()
    }
    
    func setupTipLabel() {
        tipLabelView = PPLabelView(name: "Tip", currency: currencySymbol)
        
        view.addSubview(tipLabelView)
        
        tipLabelView.translatesAutoresizingMaskIntoConstraints = false
        tipLabelView.topAnchor.constraintEqualToAnchor(ppInputView.bottomAnchor, constant: 0).active = true
        tipLabelView.widthAnchor.constraintEqualToConstant(view.frame.width).active = true
        tipLabelView.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
    }
    
    func setupTotalLabel() {
        totalLabelView = PPLabelView(name: "Total", currency: currencySymbol)
        
        view.addSubview(totalLabelView)
        
        totalLabelView.translatesAutoresizingMaskIntoConstraints = false
        totalLabelView.topAnchor.constraintEqualToAnchor(tipLabelView.bottomAnchor, constant: 0).active = true
        totalLabelView.widthAnchor.constraintEqualToConstant(view.frame.width).active = true
        totalLabelView.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
    }
    
    func changeTip() {
        
        let base = Double(ppInputView.inputField.text!) ?? 0
        
        let tipInts = [0.15, 0.20, 0.25]
        
        let tipPerc = tipInts[ppInputView.tipControl.selectedSegmentIndex]
        
        let tip = tipPerc*base
        let total = tip+base
        let currencySymbol = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String!
        
        tipLabelView.amountLabel.text = String.localizedStringWithFormat("%@%.2f", currencySymbol, tip)
        totalLabelView.amountLabel.text = String.localizedStringWithFormat("%@%.2f", currencySymbol, total)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        keyboardHeight = frame.height
        
        let navigationHeight = navigationController?.navigationBar.frame.height
        
        viewableArea = view.frame.height - keyboardHeight - navigationHeight! - 20
        
        baseViewConstraint = ppInputView.heightAnchor.constraintEqualToConstant(viewableArea/2)
        baseViewConstraint.active = true
        tipLabelView.heightAnchor.constraintEqualToConstant(viewableArea/4).active = true
        totalLabelView.heightAnchor.constraintEqualToConstant(viewableArea/4).active = true
    }
    
    func saveBillAmount() {
        let billAmount = Double(ppInputView.inputField.text!) ?? 0
        let date = NSDate.timeIntervalSinceReferenceDate()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if billAmount != 0 {
            defaults.setDouble(billAmount, forKey: Constants.lastActiveBill)
            defaults.setDouble(date, forKey: Constants.lastActiveDate)
            defaults.synchronize()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

