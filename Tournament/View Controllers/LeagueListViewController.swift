//
//  LeagueListViewController.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class LeagueListViewController: UIViewController {
    private let leagueService: LeagueService_Protocol
    private let alertPresenter: AlertPresenter_Proto

    lazy var leagueListView: LeagueListView = {
        return LeagueListView()
    }()
    
    // MARK: - Constructor
    
    init(alertPresenter: AlertPresenter_Proto = AlertPresenter(), leagueService: LeagueService_Protocol = LeagueService()) {
        self.leagueService = leagueService
        self.alertPresenter = alertPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = leagueListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leagues"
    }

}
