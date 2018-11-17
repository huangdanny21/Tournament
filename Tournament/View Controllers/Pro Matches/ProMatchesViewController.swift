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
import RxSwiftUtilities

class ProMatchesViewController: UIViewController {

    private var viewModelFactory: (ProMatchListViewModel.Inputs) -> ProMatchListViewModel = { _ in
        fatalError("Must provide factory function first.")
    }
    
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
        
        viewModelFactory =  { inputs -> ProMatchListViewModel in
            let vm = ProMatchListViewModel(inputs, dataTask: dataTask)
            vm.displayMatch
                .drive(onNext: { (proMatch) in
                    let matchDetailVC = MatchDetailViewController(matchId: proMatch.matchId)
                    self.navigationController?.pushViewController(matchDetailVC, animated: true)
                })
                .disposed(by: self.disposeBag)
            return vm
        }
        
        let viewModel = viewModelFactory(inputs)
        
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
