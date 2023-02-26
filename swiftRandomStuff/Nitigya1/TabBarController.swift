//
//  TabBarController.swift
//  Nitigya1
//
//  Created by Krithick Santhosh on 10/01/23.
//

import UIKit

class MasterTabBarController : UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupTabBar()
    }
        
    fileprivate func setupTabBar() {
        let navigationController = UINavigationController(rootViewController: TableViewController())
        navigationController.navigationBar.prefersLargeTitles = true
        
        let userScreenController = navigationController
        userScreenController.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person"), tag: 0)
        
        let sampleScreen = SampleScreen()
        sampleScreen.tabBarItem = UITabBarItem(title: "Sample", image: UIImage(systemName: "questionmark"), tag: 1)
        
        viewControllers = [userScreenController, sampleScreen]
    }
    
    fileprivate func setupLayout(){
        tabBar.isTranslucent = true
        tabBar.barTintColor = UIColor.systemGroupedBackground
    }
}
