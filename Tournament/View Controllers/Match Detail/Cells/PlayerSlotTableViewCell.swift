//
//  PlayerSlotTableViewCell.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class PlayerSlotTableViewCell: BaseTableViewCell {
    
    // MARK: - Left side
    
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    
    private let laneLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont.italicSystemFont(ofSize: 15)
        label.textAlignment = .left
        return label
    }()

    private lazy var metaDataStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.userNameLabel, self.laneLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
        return stackView
    }()
    
    private lazy var leftStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.heroImageView, self.metaDataStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    // MARK: - Right Side
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "1/1/1"
        return label
    }()
    
    private let kdaLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "KDA: 1.0"
        return label
    }()
    
    private lazy var scoreStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.scoreLabel, self.kdaLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    private let userImageView: CircleImageView = {
        let imageView = CircleImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: Item SubViews

    private let itemZeroImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemOneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemTwoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemThreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemFourImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemFiveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var itemRowOneStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.itemZeroImageView, self.itemOneImageView, self.itemTwoImageView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var itemRowTwoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.itemThreeImageView, self.itemFourImageView, self.itemFiveImageView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var itemsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.itemRowOneStackView, self.itemRowTwoStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 3
        return stackView
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.scoreStackView, self.itemsStackView, self.userImageView])
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.leftStackView, self.rightStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var playerData: MatchPlayerData? {
        didSet {
            guard let data = playerData else {
                return
            }
            self.populate(withData: data)
        }
    }
    
    // MARK: - Init
    
    override func commonInit() {
        addSubview(stackView)
        
        backgroundColor = UIColor.purple
        
        stackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    // MARK: - Populate
    
    private func populate(withData playerData: MatchPlayerData) {
        if let hero = HeroList.shared.getHero(forId: "\(playerData.heroId)") {
            populateHero(hero)
        }
        userNameLabel.text = playerData.name ?? "Username"
        userNameLabel.textColor = playerData.isRadiant ? UIColor.green : UIColor.red
        laneLabel.text = playerData.lane?.description
    }
    
    private func populateHero(_ hero: Hero) {
        heroImageView.image = UIImage(named: hero.name)
    }
    
}
