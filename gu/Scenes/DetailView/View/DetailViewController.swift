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
    var analytics: AnalyticsManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user?.login
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.analytics.log(.detailPageShowed)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        coordinator?.dismiss()
    }
}

extension DetailViewController: StoryboardInstantiable {}
