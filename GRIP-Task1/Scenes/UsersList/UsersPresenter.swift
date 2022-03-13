//
//  UsersPresenter.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 12/03/2022.
//

import Foundation

protocol UsersPresenterProtocol {
    var users: [User] { get }
    func navigateToUser(at index: Int)
}

class UsersPresenter: UsersPresenterProtocol {
    weak var usersView: UsersListViewProtocol?
    var users: [User]
    
    init(view: UsersListViewProtocol, users: [User]) {
        self.usersView = view
        self.users = users
    }
    
    func navigateToUser(at index: Int) {
        let user = users[index]
    }
}
