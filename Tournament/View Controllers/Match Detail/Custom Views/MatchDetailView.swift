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
        tableView.separatorInset = .zero
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 100
        return tableView
    }()
    
    lazy var headerView: MatchDetailHeaderView = {
        let headerView = MatchDetailHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 80))
        return headerView
    }()

    var objectViewModel: MatchDetailObjectViewModel? {
        didSet {
            headerView.objectViewModel = objectViewModel
            tableView.reloadData()
        }
    }
    
    // MARK: - Init
    
    override func commonInit() {
        addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        registerCells()
        tableView.tableHeaderView = headerView
        tableView.rowHeight = 100
        tableView.dataSource = self
    }
    
    // MARK: - Private
    
    private func registerCells() {
        tableView.register(PlayerSlotTableViewCell.self, forCellReuseIdentifier: "PlayerSlotTableViewCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension MatchDetailView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return objectViewModel?.numOfSection ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let objectViewModel = objectViewModel else {
            return 0
        }
        if section == 0 {
            return objectViewModel.radiantPlayers.count
        }
        else {
            return objectViewModel.direPlayers.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let objectViewModel = objectViewModel else {
            return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerSlotTableViewCell", for: indexPath) as! PlayerSlotTableViewCell
        var data: MatchPlayerData?
        if indexPath.section == 0 {
            data = objectViewModel.radiantPlayers[indexPath.row]
        }
        else {
            data = objectViewModel.direPlayers[indexPath.row]
        }
        cell.playerData = data
        return cell
    }
}
