//
//  MainViewViewModel.swift
//  gu
//
//  Created by Eren  Çelik on 16.03.2022.
//

import Foundation

final class MainViewViewModel: MainViewModelProtocol {
    
    weak var delegate: MainViewDelegate?
    var networkManager: NetworkManager
    var users: GitUsers = []
    
    private var pageCount = 20
    
    init(network: NetworkManager) {
        self.networkManager = network
    }
    
    func loadMoreUsers() {
        delegate?.handleOutputs(.gettingMoreUsers(false))
        if pageCount <= 100 {
            pageCount += 20
            getUsers()
            delegate?.handleOutputs(.gettingMoreUsers(true))
        }
    }
    
    func getUsers() {
        networkManager.getUsers(perPage: pageCount) { [unowned self] (result) in
            switch result {
            case .success(let user):
                DispatchQueue.global(qos: .background).async {
                    let temp = (self.users + user)
                    self.users = temp.uniqued()
                    DispatchQueue.main.async {
                        self.handleEvents(.onFetchCompleted)
                    }
                }
                
            case .failure(let error):
                self.handleEvents(.showAlert(error.localizedDescription))
            }
        }
    }
    
    private func handleEvents(_ event: MainViewOutputs) {
        delegate?.handleOutputs(event)
    }
}
