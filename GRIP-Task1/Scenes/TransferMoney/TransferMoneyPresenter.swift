//
//  TransferMoneyPresenter.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 16/03/2022.
//

import Foundation

protocol TransferMoneyPresenterProtocol {
    var user: User? { get }
}

class TransferMoneyPresenter: TransferMoneyPresenterProtocol {
    weak var view: TransferMoneyViewProtocol?
    var user: User?
    
    init(view: TransferMoneyViewProtocol, user: User) {
        self.view = view
        self.user = user
    }
}
