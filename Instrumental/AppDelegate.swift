//
//  AppDelegate.swift
//  Instrumental
//
//  Created by Donny Wals on 19/06/2018.
//  Copyright © 2018 BAMTech LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow(frame: UIScreen.main.bounds)
    window.rootViewController = ViewController()
    self.window = window
    self.window?.makeKeyAndVisible()

    return true
  }
}

