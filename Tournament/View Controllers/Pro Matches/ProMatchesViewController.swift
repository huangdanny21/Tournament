//
//  ProMatchesViewController.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ProMatchesViewController: UIViewController {
    private var viewModel: ProMatchListViewModel!
    
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()
    
    lazy var proMatchesView: ProMatchesView = {
        return ProMatchesView()
    }()
    
    // MARK: - Constructors
    
    init(alertPresenter: AlertPresenter_Proto = AlertPresenter()) {
        self.alertPresenter = alertPresenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = proMatchesView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pro Matches"
        bindRx()
    }
    
    // MARK: - Private
    
    private func bindRx() {
        let progress = MBProgressHUD()
        progress.mode = .indeterminate
        progress.label.text = "Loading..."
        
        isNetworkActive
            .drive(progress.rx_mbprogresshud_animating)
            .disposed(by: disposeBag)
        
        let inputs = ProMatchListViewModel.Inputs(
            selectMatch: proMatchesView.tableView.rx.itemSelected.asObservable(),
            refreshTrigger: proMatchesView.refreshControl.rx.controlEvent(.valueChanged).asObservable(),
            viewAppearTrigger: rx.methodInvoked(#selector(viewDidAppear(_:))).map { _ in }
        )
        
        let viewModel = ProMatchListViewModel(inputs, dataTask: dataTask)
        
        viewModel
            .displayMatch
            .drive(onNext: { (proMatch) in
                let matchDetailVC = MatchDetailViewController(matchId: proMatch.matchId)
                self.navigationController?.pushViewController(matchDetailVC, animated: true)
            })
            .disposed(by: self.disposeBag)
        
        viewModel
            .proMatchObjectViewModels
            .drive(proMatchesView.tableView.rx.items(cellIdentifier: "ProMatchTableViewCell", cellType: ProMatchTableViewCell.self)) { _ , proMatchVM, cell in
                cell.set(withProMatchViewModel: proMatchVM)
            }
            .disposed(by: disposeBag)
        
        viewModel.endRefreshing
            .drive(onNext: { () in
                self.proMatchesView.refreshControl.endRefreshing()
            })
            .disposed(by: disposeBag)
    }
}
