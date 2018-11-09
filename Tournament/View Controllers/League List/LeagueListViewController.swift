//
//  LeagueListViewController.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LeagueListViewController: UIViewController {
    private let viewModel: LeagueListViewModel
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()
    
    lazy var leagueListView: LeagueListView = {
        return LeagueListView()
    }()
    
    // MARK: - Constructor
    
    init(alertPresenter: AlertPresenter_Proto = AlertPresenter(), viewModel: LeagueListViewModel = LeagueListViewModel()) {
        self.viewModel = viewModel
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
        bindTableView()
    }
    
    // MARK: - Data
    
    private func bindTableView() {
        viewModel
            .leagueListData
            .drive(leagueListView.leagueListTableView.rx.items(cellIdentifier: "Cell")) { _, repository, cell in
//                cell.textLabel?.text = repository.name
//                cell.detailTextLabel?.text = repository.url
            }
            .disposed(by: disposeBag)
        
    }

}
