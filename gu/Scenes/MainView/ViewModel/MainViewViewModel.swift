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
    private var pageCount = 20
    var users: GitUsers = []
    
    init(network: NetworkManager) {
        self.networkManager = network
    }
    
    func loadMoreUsers(index: Int) {
        if index == users.count - 1 && pageCount <= 100 {
            pageCount += 20
            getUsers(perPage: pageCount)
            self.delegate?.handleOutputs(.addPagi(true))
        }
    }
    
    func getUsers(perPage: Int) {
        networkManager.getUsers(perPage: perPage) { [unowned self] (result) in
            switch result {
            case .success(let user):
                DispatchQueue.global(qos: .default).async {
                    let temp = (self.users + user)
                    self.users = temp.uniqued()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.delegate?.handleOutputs(.onFetchCompleted)
                        self.delegate?.handleOutputs(.addPagi(false))
                    }
                }
            case .failure(let error):
                self.delegate?.handleOutputs(.showAlert(error.localizedDescription))
            }
        }
    }
}
