//
//  StartUpViewController.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift

class StartUpViewController: UIViewController {
    
    // MARK: - View Controller Life Cycle
    private let disposeBag = DisposeBag()
    private let viewModel = StartUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel
            .toHomeObservable
            .subscribe(onNext: { [weak self]() in
                let homeVC = HomeViewController()
                self?.navigationController?.pushViewController(homeVC, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
