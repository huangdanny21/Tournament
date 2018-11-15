//
//  SignUpViewController.swift
//  Tournament
//
//  Created by Danny on 11/14/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit
import RxSwift

class SignUpViewController: UIViewController {

    private let viewModel: SignUpViewModel
    private let disposeBag = DisposeBag()
    
    private lazy var signUpView: SignUpView = {
       return SignUpView()
    }()
    
    // MARK: - Constructors
    
    init(viewModel: SignUpViewModel = SignUpViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Controller Life Cycle
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sign Up"
    }
}
