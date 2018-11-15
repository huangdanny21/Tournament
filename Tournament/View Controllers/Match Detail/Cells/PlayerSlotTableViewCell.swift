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
    
    private let kdaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textAlignment = .right
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var scoreStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.kdaLabel, self.scoreLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
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
        imageView.backgroundColor = UIColor.lightGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemOneImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemTwoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemThreeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemFourImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let itemFiveImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.lightGray
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var itemRowOneStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.itemZeroImageView, self.itemOneImageView, self.itemTwoImageView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2.5
        return stackView
    }()
    
    private lazy var itemRowTwoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.itemThreeImageView, self.itemFourImageView, self.itemFiveImageView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 2.5
        return stackView
    }()
    
    private lazy var itemsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.itemRowOneStackView, self.itemRowTwoStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 2.5
        return stackView
    }()
    
    private lazy var rightStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.scoreStackView, self.itemsStackView, self.userImageView])
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [self.leftStackView, self.rightStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        return stackView
    }()
    
    let activityIndicatorView: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .whiteLarge)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    // MARK: - Data
    
    weak var playerData: MatchPlayerData? {
        didSet {
            guard let data = playerData else {
                return
            }
            self.populate(withData: data)
        }
    }
    
    weak var imageManager: ImageManager?
    var request : ImageRequest?
    
    // MARK: - Init
    
    override func commonInit() {
        addSubview(stackView)
        
        backgroundColor = UIColor.purple
        
        userImageView.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.width.equalTo(self.userImageView.bounds.size.height)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    // MARK: - Cell Life Cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        heroImageView.image = nil
        userImageView.image = nil
        itemZeroImageView.image = UIImage(named: "small_x_icon")
        itemOneImageView.image = UIImage(named: "small_x_icon")
        itemTwoImageView.image = UIImage(named: "small_x_icon")
        itemThreeImageView.image = UIImage(named: "small_x_icon")
        itemFourImageView.image = UIImage(named: "small_x_icon")
        itemFiveImageView.image = UIImage(named: "small_x_icon")
        userNameLabel.text = nil
        scoreLabel.text = nil
        laneLabel.text = nil
        kdaLabel.text = nil
        request?.cancel()
    }
    
    // MARK: - Populate
    
    private func populate(withData playerData: MatchPlayerData) {
        if let hero = HeroList.shared.getHero(forId: "\(playerData.heroId)") {
            populateHero(hero)
        }
        populateItems(playerData)
        userNameLabel.text = playerData.name ?? "Username"
        userNameLabel.textColor = playerData.isRadiant ? UIColor.green : UIColor.red
        laneLabel.text = playerData.lane?.description
        kdaLabel.text = "KDA: \(playerData.kda)"
        scoreLabel.text = "\(playerData.kills)/\(playerData.deaths)/\(playerData.assists)"
        //loadImage(withUrl: play)
    }
    
    private func populateHero(_ hero: Hero) {
        heroImageView.image = UIImage(named: hero.name)
    }
    
    private func populateItems(_ playerData: MatchPlayerData) {
        if let itemZeroImageName = ItemList.shared.getItemImageName(forId: "\(playerData.item0)") {
            itemZeroImageView.image = UIImage(named: itemZeroImageName)
        }
        if let itemOneImageName = ItemList.shared.getItemImageName(forId: "\(playerData.item1)") {
            itemOneImageView.image = UIImage(named: itemOneImageName)
        }
        if let itemTwoImageName = ItemList.shared.getItemImageName(forId: "\(playerData.item2)") {
            itemTwoImageView.image = UIImage(named: itemTwoImageName)
        }
        if let itemThreeImageName = ItemList.shared.getItemImageName(forId: "\(playerData.item3)") {
            itemThreeImageView.image = UIImage(named: itemThreeImageName)
        }
        if let itemFourImageName = ItemList.shared.getItemImageName(forId: "\(playerData.item4)") {
            itemFourImageView.image = UIImage(named: itemFourImageName)
        }
        if let itemFiveImageName = ItemList.shared.getItemImageName(forId: "\(playerData.item5)") {
            itemFiveImageView.image = UIImage(named: itemFiveImageName)
        }
    }
    
    // MARK: - Image Retrieve
    
    private func loadImage(withUrl url: String) {
        if let image = imageManager?.cachedImage(for: url) {
            userImageView.image = image
            return
        }
        downloadImage(withUrl: url)
    }
    
    private func downloadImage(withUrl url: String) {
        activityIndicatorView.startAnimating()
        request = imageManager?.retrieveImage(for: url) { [weak self]image in
            self?.userImageView.image = imageManager
        }
    }
}
