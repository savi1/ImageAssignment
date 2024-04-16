//
//  AppDelegate.swift
//  ImageAssignment
//
//  Created by Savi Bhatia on 15/04/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
               window = UIWindow(frame: UIScreen.main.bounds)
               
               // Set up your initial view controller
               let initialViewController = ImageGridViewController()
               
               // Set the initial view controller as the root view controller of the window
               window?.rootViewController = initialViewController
               
               // Make the window visible
               window?.makeKeyAndVisible()
        return true
    }


   

   
}

