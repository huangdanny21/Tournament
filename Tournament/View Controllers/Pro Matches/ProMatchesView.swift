//
//  ProMatchesView.swift
//  Tournament
//
//  Created by Danny on 11/9/18.
//  Copyright © 2018 Danny. All rights reserved.
//

import SnapKit

class ProMatchesView: BaseView {
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 100
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    override func commonInit() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        registerCells()
    }
    
    // MARK: - Private
    
    private func registerCells() {
        tableView.register(ProMatchTableViewCell.self, forCellReuseIdentifier: "ProMatchTableViewCell")
    }
}
