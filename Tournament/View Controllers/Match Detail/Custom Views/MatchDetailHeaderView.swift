//
//  MatchDetailHeaderView.swift
//  Tournament
//
//  Created by Danny on 11/10/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class MatchDetailHeaderView: UITableViewHeaderFooterView {
    
    // MARK: - Start Date View
    
    private let startDateTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let startDateLabel: UILabel = {
        let label = UILabel()
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
        return label
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
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
        return label
    }()
    
    private let skillLabel: UILabel = {
        let label = UILabel()
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
    
    private let lobbyTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let lobbyLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var lobbyStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.lobbyTitleLabel, self.lobbyLabel])
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
    
    // MARK: - Constructor
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
