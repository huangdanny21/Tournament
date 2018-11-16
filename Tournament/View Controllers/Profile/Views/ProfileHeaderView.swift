//
//  ProfileHeaderView.swift
//  Tournament
//
//  Created by Danny on 11/15/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

class ProfileHeaderView: BaseView {
    // First Stack View row
    
    let userImageView: CircleImageView = {
        let imageView = CircleImageView()
        return imageView
    }()
    
    private let postCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let postCountTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var postStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postCountLabel, postCountTitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 2.5
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let followersCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let followersCountTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var followerStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followersCountLabel, followersCountTitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 2.5
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let followingCountLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let followingCountTitleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var followingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followingCountLabel, followingCountTitleLabel])
        stackView.axis = .vertical
        stackView.spacing = 2.5
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var statsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postStackView, followerStackView, followingStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private let editProfileButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    // Secone Stack View Row
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let teamLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let roleLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    
}
