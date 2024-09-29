//
//  WorkoutWithABuddyApp.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/24/24.
//

import SwiftUI


@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Create a window
        window = UIWindow(frame: UIScreen.main.bounds)
        
        // Set the root view controller to the TabBarController
        window?.rootViewController = MainTabBarController()
        window?.makeKeyAndVisible()
        
        return true
    }
}
