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
        viewModel.getUsers()
        setTableView()
        setStyle()
    }
    
    private func setStyle() {
        showHud(show: true)
        navigationItem.title = "Users"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func loadingIndicator(show: Bool) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0,y: 0,
                                              width: view.frame.size.width,
                                              height: 90))
        let indicator = UIActivityIndicatorView()
        indicator.center = footerView.center
        footerView.addSubview(indicator)
        indicator.startAnimating()
        return show ? footerView : nil
    }
}

extension MainViewController: MainViewDelegate {
    
    func handleOutputs(_ output: MainViewOutputs) {
        switch output {
        case .onFetchCompleted:
            showHud(show: false)
            tableView.reloadData()
        case let .addIndicator(show):
            tableView.tableFooterView = loadingIndicator(show: show)
        case let .showAlert(error):
            showHud(text: error,viewType: .error, show: true, afterDismiss: 2)
        }
    }
}
