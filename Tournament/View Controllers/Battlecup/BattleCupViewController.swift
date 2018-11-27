//
//  BattleCupViewController.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class BattleCupViewController: UIViewController {

    private lazy var battleCupView: BattleCupView = {
        return BattleCupView()
    }()
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = battleCupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
