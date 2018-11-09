//
//  ViewController.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class HomeViewController: UITabBarController {

    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTabbarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    // MARK: - Private
    
    private func addTabbarItems() {
        let proMatchVC = ProMatchesViewController()
        proMatchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 0)
        let controllers = [proMatchVC].map({
            UINavigationController(rootViewController: $0)
        })
        viewControllers = controllers
    }
}
