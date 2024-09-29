//
//  ContentView.swift
//  WorkoutWithABuddy
//
//  Created by Julia Mahon Kuzin on 9/24/24.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
    }
    
    private func setupTabs() {
        let exerciseInputVC = self.createNav(with: "Edit", and: UIImage(systemName: "square.and.pencil"), vc: ExerciseInputViewController())
        let exerciseInputVC2 = self.createNav(with: "Disp", and: UIImage(systemName: "house"), vc: ExerciseInputViewController())
        
        self.setViewControllers([exerciseInputVC, exerciseInputVC2], animated: true)
        
    }
    
    private func createNav(with title: String, and image: UIImage?, vc: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: vc)
        
        nav.tabBarItem.title = title
        nav.tabBarItem.image = image
//        nav.navigationItem.title =  // used if you have a longer title
        nav.viewControllers.first?.navigationItem.title = title + " Controller"
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Button", style: .plain, target: nil, action: nil)
        return nav
    }
}

#Preview {
    MainTabBarController()
}
