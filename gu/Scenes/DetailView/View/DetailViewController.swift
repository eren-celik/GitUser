//
//  DetailViewController.swift
//  gu
//
//  Created by Eren  Çelik on 6.03.2022.
//

import UIKit

final class DetailViewController: UIViewController {
    
    weak var coordinator: DetailViewCoordinator?
    var user: GitUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user?.login
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.dismiss()
    }
}

extension DetailViewController: Storyboarded {}
