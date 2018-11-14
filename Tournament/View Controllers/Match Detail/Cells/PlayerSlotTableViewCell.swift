//
//  PlayerSlotTableViewCell.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class PlayerSlotTableViewCell: BaseTableViewCell {
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let laneLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let kdaLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    private let userImageView: CircleImageView = {
        let imageView = CircleImageView()
        return imageView
    }()
    
    // MARK: Item SubViews

    private let itemZeroImageView: UIImageView = {
       let imageView = UIImageView()
        return imageView
    }()
    
    private let itemOneImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let itemTwoImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let itemThreeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let itemFourImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let itemFiveImageView: UIImageView = {
        let imageView = UIImageView()
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
    
    
}
