//
//  MainViewController.swift
//  gu
//
//  Created by Eren  Çelik on 20.02.2022.
//

import UIKit

final class MainViewController: BaseViewController, Storyboarded {
    
    @IBOutlet weak var tableView: UITableView!
    weak var coordinator: MainCoordinator?
    
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
        viewModel.getUsers(perPage: 20)
        setTableView()
        setStyle()
    }
    
    private func setStyle() {
        showHud(show: true)
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

extension MainViewController: MainViewDelegate {
    
    func handleOutputs(_ output: MainViewOutputs) {
        
        defer {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        switch output {
        case .onFetchCompleted:
            showHud(show: false)
        case .showAlert(let error):
            showHud(text: error,
                    viewType: .error,
                    show: true,
                    afterDismiss: 2)
        }
    }
}
