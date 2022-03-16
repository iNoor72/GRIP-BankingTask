//
//  UserDetailsPresenter.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 13/03/2022.
//

import Foundation

protocol UserDetailsPresenterProtocol {
    var user: User? { get }
}

class UserDetailsPresenter: UserDetailsPresenterProtocol {
    weak var view: UserDetailsViewProtocol?
    var user: User?
    
    init(view: UserDetailsViewProtocol, user: User) {
        self.view = view
        self.user = user
    }
}
