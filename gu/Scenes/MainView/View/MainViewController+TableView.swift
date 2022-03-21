//
//  MainViewController+TableView.swift
//  gu
//
//  Created by Eren  Çelik on 4.03.2022.
//

import UIKit

extension MainViewController {
    
    internal func setTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        
        setCells()
        setTableViewStyle()
    }
    
    private func setCells() {
        let nibName = UINib(nibName: "UserCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "UserCell")
    }
    
    private func setTableViewStyle() {
        tableView.separatorStyle = .none
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showDetail(user: viewModel.users[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        viewModel.loadMoreUsers(index: indexPath.row)
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UserCell = tableView.reusableCell()
        cell.data = viewModel.users[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.count
    }
}
