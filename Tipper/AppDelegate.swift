//
//  AppDelegate.swift
//  Tipper
//
//  Created by Prithvi Prabahar on 9/11/16.
//  Copyright © 2016 Prithvi Prabahar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navController: UINavigationController?
    var tipViewController: TipViewController!
    var mySettingsViewController: SettingsViewController!


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        setDefaults()
        
        tipViewController = TipViewController()
        mySettingsViewController = SettingsViewController()
        
        tipViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .Plain, target: self, action: #selector(pushSettings))
        
        navController = UINavigationController(rootViewController: tipViewController)
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController = navController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func setDefaults() {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (defaults.objectForKey(Constants.defaultIndex) == nil) {
            defaults.setInteger(1, forKey: Constants.defaultIndex)
            defaults.synchronize()
        }
    }
    
    func pushSettings() {
        navController?.pushViewController(mySettingsViewController, animated: true)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        tipViewController.saveBillAmount()
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

