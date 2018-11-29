//
//  BattleCupViewController.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift

class BattleCupViewController: UIViewController {

    private let disposeBag = DisposeBag()
    
    private lazy var battleCupView: BattleCupView = {
        return BattleCupView()
    }()
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = battleCupView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindRx()
    }
    
    // MARK: - Rx
    
    private func bindRx() {
        let inputs = BattleCupViewModel.Inputs(
            createRequest: battleCupView.createRequestButton.rx.tap.asObservable(),
            viewAppearTrigger: rx.methodInvoked(#selector(viewDidAppear(_:))).map { _ in }
            )
        
        let viewModel = BattleCupViewModel(inputs)
        
        viewModel
            .toCreateRequest
            .drive(onNext: { () in
                let requestVC = BattleCupRequestViewController()
                self.navigationController?.present(requestVC, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }

}
