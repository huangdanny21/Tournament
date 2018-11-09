//
//  LeagueListView.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

class LeagueListView: UIView {
    let leagueListTableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    // MARK: - Constructor
    
    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        addSubview(leagueListTableView)
        
        leagueListTableView.snp.makeConstraints { (make) in
            make.size.equalToSuperview()
        }
    }
}
