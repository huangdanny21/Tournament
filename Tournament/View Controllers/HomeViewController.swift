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
        let battleCupVC = BattleCupViewController()
        let proMatchVC = ProMatchesViewController()
        let profileVC = ProfileViewController()
        battleCupVC.tabBarItem = UITabBarItem(title: "Battle Cup", image: UIImage(named: "tournament_icon"), tag: 0)
        proMatchVC.tabBarItem = UITabBarItem(title: "Pro Matches", image: UIImage(named: "duel_icon"), tag: 1)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile_icon"), tag: 2)
        let controllers = [battleCupVC, proMatchVC, profileVC].map({
            UINavigationController(rootViewController: $0)
        })
        viewControllers = controllers
        selectedIndex = 1
    }
}
