//
//  MatchDetailViewController.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxSwiftUtilities

class MatchDetailViewController: UIViewController {

    private let viewModel: MatchDetailViewModel
    private let disposeBag = DisposeBag()
    
    private lazy var matchDetailView: MatchDetailView = {
        return MatchDetailView()
    }()
    
    // MARK: - Constructors
    
    init(viewModel: MatchDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = matchDetailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Match Detail"
        bindLoadingIndicator()
        bindTableView()
    }
    
    // MARK: - Data
    
    private func bindTableView() {
        viewModel
            .matchDetailData
            .trackActivity(viewModel.activityIndicator)
            .subscribe(onNext: { [weak self](objectViewModel) in
                self?.matchDetailView.objectViewModel = objectViewModel
            }, onError: { (error) in
                
            })
            .disposed(by: disposeBag)
    }
    
    private func bindLoadingIndicator() {
        let progress = MBProgressHUD(view: matchDetailView)
        progress.mode = .indeterminate
        progress.label.text = "Loading..."
        
        viewModel
            .activityIndicator.asDriver()
            .drive(progress.rx_mbprogresshud_animating)
            .disposed(by: disposeBag)
    }
}
