//
//  TransferMoneyPresenter.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 16/03/2022.
//

import Foundation

protocol TransferMoneyPresenterProtocol {
    var user: User? { get }
    var databaseManager: CoreDataManager? { get }
}

class TransferMoneyPresenter: TransferMoneyPresenterProtocol {
    weak var view: TransferMoneyViewProtocol?
    var user: User?
    var databaseManager: CoreDataManager?
    
    init(view: TransferMoneyViewProtocol, user: User, databaseManager: CoreDataManager) {
        self.view = view
        self.user = user
        self.databaseManager = databaseManager
    }
}
