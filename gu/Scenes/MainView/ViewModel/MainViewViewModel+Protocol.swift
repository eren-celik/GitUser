//
//  MainViewViewModel+Protocol.swift
//  gu
//
//  Created by Eren  Çelik on 16.03.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var delegate: MainViewDelegate? { get set }
    var networkManager: NetworkManager { get set }
}

protocol MainViewDelegate: AnyObject {
    func handleOutputs(_ output: MainViewOutputs)
}

enum MainViewOutputs: Equatable {
    case onFetchCompleted
    case addIndicator(Bool)
    case showAlert(String)
}
