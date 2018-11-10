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

class MatchDetailViewController: UIViewController {

    private let viewModel: MatchDetailViewModel
    private let disposeBag = DisposeBag()
    
    lazy var matchDetailView: MatchDetailView = {
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
    }
}
