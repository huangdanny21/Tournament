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
    private var viewModel: MatchDetailViewModel!
    private let disposeBag = DisposeBag()
    
    private let matchId: Int
    
    private lazy var matchDetailView: MatchDetailView = {
        return MatchDetailView()
    }()
    
    // MARK: - Constructors
    
    init(matchId: Int) {
        self.matchId = matchId
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

        let inputs = MatchDetailViewModel.Inputs(
            viewAppearTrigger: rx.methodInvoked(#selector(viewDidAppear(_:))).map { _ in }
        )
        
        viewModel = MatchDetailViewModel(inputs, matchId, dataTask: dataTask)
        
        viewModel
            .matchDetailObjectViewModel
            .drive(onNext: { (objectViewModel) in
                self.matchDetailView.objectViewModel = objectViewModel
            })
            .disposed(by: disposeBag)
    }
}
