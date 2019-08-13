//
//  TabBarController.swift
//  OptionDB
//
//  Created by Connor Lagana on 8/12/19.
//  Copyright © 2019 Connor Lagana. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupControllers()
    }
    
    func setupControllers()  {
        let homeController = UINavigationController(rootViewController: HomeController(collectionViewLayout: UICollectionViewFlowLayout()))
        homeController.tabBarItem.title = "Home"
        homeController.tabBarItem.image = #imageLiteral(resourceName: "home")
        
        let searchController = SearchController()
        searchController.tabBarItem.title = "Search"
        searchController.tabBarItem.image = #imageLiteral(resourceName: "search")
        
        let profileController = ProfileController()
        profileController.tabBarItem.title = "Profile"
        profileController.tabBarItem.image = #imageLiteral(resourceName: "profile")
        
        let learnController = LearnController()
        learnController.tabBarItem.title = "Learn"
        learnController.tabBarItem.image = #imageLiteral(resourceName: "book")
        
        viewControllers = [
            homeController,
            searchController,
            learnController,
            profileController
        ]
    }
}
