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
    }
    
    private func setCells() {
        let nibName = UINib(nibName: "UserCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "UserCell")
    }
}

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
    }
}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell")!
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
