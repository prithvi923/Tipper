//
//  ViewController.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ppInputView: PPInputView!
    var tipLabel: PPLabel!
    var totalLabel: PPLabel!
    var keyboardHeight: CGFloat!
    var viewableArea: CGFloat!
    var baseViewConstraint: NSLayoutConstraint!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Tipper"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(keyboardWillShow), name: UIKeyboardWillShowNotification, object: nil)
        
        
        setupBaseView()
        setupTipLabel()
        setupTotalLabel()
    }
    
    func showSettings() {
        print("here")
    }
    
    func setupBaseView() {
        ppInputView = PPInputView(viewWidth: view.frame.width)
        
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
        tipLabel = PPLabel()
        
        view.addSubview(tipLabel)
        
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        tipLabel.topAnchor.constraintEqualToAnchor(ppInputView.bottomAnchor, constant: 0).active = true
        tipLabel.widthAnchor.constraintEqualToConstant(view.frame.width).active = true
        tipLabel.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
    }
    
    func setupTotalLabel() {
        totalLabel = PPLabel()
        
        view.addSubview(totalLabel)
        
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.topAnchor.constraintEqualToAnchor(tipLabel.bottomAnchor, constant: 0).active = true
        totalLabel.widthAnchor.constraintEqualToConstant(view.frame.width).active = true
        totalLabel.rightAnchor.constraintEqualToAnchor(view.rightAnchor, constant: 0).active = true
    }
    
    func changeTip() {
        
        let base = Double(ppInputView.inputField.text!) ?? 0
        
        let tipInts = [0.15, 0.20, 0.25]
        
        let tipPerc = tipInts[ppInputView.tipControl.selectedSegmentIndex]
        
        let tip = tipPerc*base
        let total = tip+base
        
        tipLabel.text = String.localizedStringWithFormat("+ $%.2f", tip)
        totalLabel.text = String.localizedStringWithFormat("= $%.2f", total)
    }
    
    func keyboardWillShow(notification: NSNotification) {
        let frame = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue).CGRectValue()
        
        keyboardHeight = frame.height
        
        let navigationHeight = navigationController?.navigationBar.frame.height
        
        viewableArea = view.frame.height - keyboardHeight - navigationHeight! - 20
        
        baseViewConstraint = ppInputView.heightAnchor.constraintEqualToConstant(viewableArea/2)
        baseViewConstraint.active = true
        tipLabel.heightAnchor.constraintEqualToConstant(viewableArea/4).active = true
        totalLabel.heightAnchor.constraintEqualToConstant(viewableArea/4).active = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

