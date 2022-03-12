//
//  UsersPresenter.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 12/03/2022.
//

import Foundation

protocol UsersPresenterProtocol {
    var users: [User] { get }
}

class UsersPresenter: UsersPresenterProtocol {
    weak var usersView: UsersListViewProtocol?
    var users: [User]
    
    init(view: UsersListViewProtocol, users: [User]) {
        self.usersView = view
        self.users = users
    }
}
