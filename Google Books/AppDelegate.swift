//
//  AppDelegate.swift
//  Google Books
//
//  Created by Iyin Raphael on 12/10/18.
//  Copyright © 2018 Iyin Raphael. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let bookController = BookController()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        bookController.request()
        bookController.loadToPersistence()
        return true
    }
}

