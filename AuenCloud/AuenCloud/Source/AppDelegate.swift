//
//  AppDelegate.swift
//  AuenCloud
//
//  Created by Admin on 12/3/20.
//

import Foundation
import UIKit
import CoreData
import IQKeyboardManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Window
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
  
        makeRootVC()
        return true
    }
    

    
    func makeRootVC() -> Void {
        AppCenter.shared.createWindow(window!)
        AppCenter.shared.start()
    }
    

}


