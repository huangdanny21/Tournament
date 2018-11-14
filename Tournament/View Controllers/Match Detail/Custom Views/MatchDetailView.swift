//
//  MatchDetailView.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import UIKit

class MatchDetailView: BaseView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 100
        return tableView
    }()
    
    lazy var headerView: MatchDetailHeaderView = {
        let headerView = MatchDetailHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80))
        return headerView
    }()

    
    // MARK: - Init
    
    override func commonInit() {
        addSubview(tableView)
        tableView.tableHeaderView = headerView
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}
