//
//  MainViewViewModel+Protocol.swift
//  gu
//
//  Created by Eren  Çelik on 16.03.2022.
//

import Foundation

protocol MainViewModelProtocol {
    var delegate: MainViewDelegate? { get set }
}

protocol MainViewDelegate: AnyObject {
    func handleOutputs(_ output: MainViewOutputs)
}

enum MainViewOutputs {
    case showUsers(GitUsers)
    case showAlert(String)
}
