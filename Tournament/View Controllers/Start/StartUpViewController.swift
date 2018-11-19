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
    private let disposeBag = DisposeBag()
    
    // MARK: - View Controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewModel = StartUpViewModel()
        
        viewModel
            .toHome
            .drive(onNext: { [weak self]() in
                let homeVC = HomeViewController()
                self?.navigationController?.pushViewController(homeVC, animated: false)
            })
            .disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
