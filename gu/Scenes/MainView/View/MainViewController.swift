//
//  MainViewController.swift
//  gu
//
//  Created by Eren  Çelik on 20.02.2022.
//

import UIKit

final class MainViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    weak var coordinator: MainCoordinator?
    var users: GitUsers = []
    
    var viewModel: MainViewViewModel! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    private func configureView() {
        viewModel.getUsers(perPage: 50)
        setTableView()
        setStyle()
    }
    
    private func setStyle() {
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MainViewController: MainViewDelegate {
    
    func handleOutputs(_ output: MainViewOutputs) {
        defer { tableView.reloadData() }
        switch output {
        case .showUsers(let user):
            users = user
        case .showAlert(let error):
            print("DEBUG: error", error)
        }
    }
}
