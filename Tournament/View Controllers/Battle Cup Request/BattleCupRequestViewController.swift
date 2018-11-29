//
//  BattleCupRequestViewController.swift
//  Tournament
//
//  Created by Danny on 11/28/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BattleCupRequestViewController: BaseKeyboardViewController {

    private let disposeBag = DisposeBag()
    
    private lazy var requestView: BattleCupRequestView = {
        return BattleCupRequestView()
    }()
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = requestView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindRx()
        requestView
            .submitButton
            .becomeFirstResponder()
    }
    
    // MARK: - Bind Rx
    
    private func bindRx() {
        let inputs = BattleCupRequestViewModel.Inputs(
            steamIdText: requestView.steamIdTextField.rx.text.orEmpty.asObservable(),
            serverText: requestView.serverTextField.rx.text.orEmpty.asObservable(),
            tierText: requestView.tierTextField.rx.text.orEmpty.asObservable(),
            roleText: requestView.roleTextField.rx.text.orEmpty.asObservable(),
            otherInformationText: requestView.otherInformationTextField.rx.text.orEmpty.asObservable()
        )
        
        let viewModel = BattleCupRequestViewModel(inputs)
        viewModel
            .enableSubmitButton
            .drive(requestView.submitButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }

}
