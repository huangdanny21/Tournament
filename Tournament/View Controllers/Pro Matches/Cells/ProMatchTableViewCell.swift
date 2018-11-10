//
//  ProMatchTableViewCell.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class ProMatchTableViewCell: BaseTableViewCell {
    let radiantTeamImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let radiantTeamNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let startTimeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let leagueLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let direTeamImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    let direTeamNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private lazy var radiantStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.radiantTeamImageView, self.radiantTeamNameLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var metaDataStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.scoreLabel, self.startTimeLabel, self.leagueLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalSpacing
        //stackView.distribution = .equalCentering
        //stackView.spacing = 5
        return stackView
    }()
    
    private lazy var direStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.direTeamImageView, self.direTeamNameLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .equalCentering
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.radiantStackView, self.metaDataStackView, self.direStackView])
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    override func commonInit() {
        backgroundColor = UIColor.white
        addSubview(stackView)
        
        stackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Public
    
    func set(withProMatchViewModel viewModel: ProMatchObjectViewModel) {
        radiantTeamNameLabel.text = viewModel.radiantName
        scoreLabel.text = "WHO CARES"
        startTimeLabel.text = "\(viewModel.startTime)"
        leagueLabel.text = viewModel.object.leagueName
        direTeamNameLabel.text = viewModel.direName
    }
}
