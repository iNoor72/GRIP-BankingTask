//
//  UsersPresenter.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 12/03/2022.
//

import Foundation
import CoreData

protocol UsersPresenterProtocol {
    var users: [User]? { get set }
    func navigateToUser(at index: Int)
    func fetchData()
}

class UsersPresenter: UsersPresenterProtocol {
    weak var usersView: UsersListViewProtocol?
    var users: [User]?
    
    init(view: UsersListViewProtocol, users: [User]) {
        self.usersView = view
        self.users = users
    }
    
    func navigateToUser(at index: Int) {
        guard let user = users?[index] else { return }
        let route = UsersListRoutes.UserDetails(user)
        usersView?.navigate(to: route)
    }
    
    func fetchData() {
        let users = CoreDataManager.shared.fetchUsersData()
        self.users = users
    }
}
