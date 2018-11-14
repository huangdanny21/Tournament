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

    private let viewModel: ProMatchesViewModel
    private let alertPresenter: AlertPresenter_Proto
    private let disposeBag = DisposeBag()
    
    lazy var proMatchesView: ProMatchesView = {
        return ProMatchesView()
    }()
    
    // MARK: - Constructors
    
    init(alertPresenter: AlertPresenter_Proto = AlertPresenter(), viewModel: ProMatchesViewModel = ProMatchesViewModel()) {
        self.viewModel = viewModel
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
        bindTableView()
    }
    
    // MARK: - Data
    
    private func bindTableView() {
        
        viewModel
            .activityIndicator.asDriver()
            .drive(proMatchesView.activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
        
//        viewModel
//            .activityIndicator.asObservable()
//            .subscribe(onNext: { [weak self](isRunning) in
//                if isRunning {
//                    self?.showSpinner()
//                }
//                else {
//                    self?.hideSpinner()
//                }
//            }, onError: { (error) in
//                self?.hideSpinner()
//            })
//            .disposed(by: disposeBag)
        
        
        viewModel
            .proMatchesData
            .drive(proMatchesView.tableView.rx.items(cellIdentifier: "ProMatchTableViewCell", cellType: ProMatchTableViewCell.self)) { _ , proMatchVM, cell in
                cell.set(withProMatchViewModel: proMatchVM)
            }
            .disposed(by: disposeBag)

        proMatchesView.tableView.rx.modelSelected(ProMatchObjectViewModel.self)
            .subscribe(onNext: { [weak self](viewModel) in
                let matchDetailViewModel = MatchDetailViewModel(withMatchId: viewModel.object.matchId)
                let matchDetailVC = MatchDetailViewController(viewModel: matchDetailViewModel)
                self?.navigationController?.pushViewController(matchDetailVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: - Loading
    
    private func showSpinner() {
        proMatchesView.activityIndicatorView.startAnimating()
    }
    
    private func hideSpinner() {
        proMatchesView.activityIndicatorView.stopAnimating()
    }
}
