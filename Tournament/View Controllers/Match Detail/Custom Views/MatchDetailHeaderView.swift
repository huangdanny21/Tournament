//
//  MatchDetailHeaderView.swift
//  Tournament
//
//  Created by Danny on 11/10/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class MatchDetailHeaderView: BaseView {
    
    // MARK: - Start Date View
    
    private let startDateTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let startDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var startDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.startDateTitleLabel, self.startDateLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.spacing = 5
        return stackView
    }()
    
    // MARK: - Duration View
    
    private let durationTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var durationStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.durationTitleLabel, self.durationLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.spacing = 5
        return stackView
    }()
    
    // MARK: - Skill View
    
    private let skillTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let skillLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var skillStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.skillTitleLabel, self.skillLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.spacing = 5
        return stackView
    }()
    
    // MARK: - Lobby View
    
    private let gameModeTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private let gameModeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var lobbyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.gameModeTitleLabel, self.gameModeLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.startDateStackView, self.durationStackView, self.skillStackView, self.lobbyStackView])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        //stackView.spacing = 5
        return stackView
    }()
    
    var objectViewModel: MatchDetailObjectViewModel? {
        didSet {
            guard let objectViewModel = objectViewModel else {
                return
            }
            startDateLabel.text = objectViewModel.startDate
            durationLabel.text = objectViewModel.duration
            skillLabel.text = objectViewModel.skillLevel
            gameModeLabel.text = objectViewModel.gameMode
        }
    }
    
    // MARK: - Init
    
    override func commonInit() {
        backgroundColor = UIColor.black
        
        addSubview(stackView)
        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
