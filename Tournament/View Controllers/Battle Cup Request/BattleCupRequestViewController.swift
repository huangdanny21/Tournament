//
//  BattleCupRequestViewController.swift
//  Tournament
//
//  Created by Danny on 11/28/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift

class BattleCupRequestViewController: UIViewController {

    private lazy var requestView: BattleCupRequestView = {
        return BattleCupRequestView()
    }()
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindRx()
        
    }
    
    // MARK: - Bind Rx
    
    override func loadView() {
        view = requestView
    }
    
    private func bindRx() {
        
    }

}
