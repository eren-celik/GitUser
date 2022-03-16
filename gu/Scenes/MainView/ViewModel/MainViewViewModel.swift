//
//  MainViewViewModel.swift
//  gu
//
//  Created by Eren  Çelik on 16.03.2022.
//

import Foundation

final class MainViewViewModel: MainViewModelProtocol {
    
    weak var delegate: MainViewDelegate?
    private var networkManager: NetworkManager
    
    init(network: NetworkManager) {
        self.networkManager = network
    }
    
    func getUsers(perPage: Int) {
        networkManager.getUsers(perPage: perPage) { (result) in
            switch result {
            case .success(let user):
                self.delegate?.handleOutputs(.showUsers(user))
            case .failure(let error):
                self.delegate?.handleOutputs(.showAlert(error.localizedDescription))
            }
        }
    }
}
