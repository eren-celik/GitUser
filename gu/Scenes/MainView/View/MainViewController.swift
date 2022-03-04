//
//  MainViewController.swift
//  gu
//
//  Created by Eren  Çelik on 20.02.2022.
//

import UIKit

final class MainViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setStyle()
    }
    
    private func setStyle() {
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
