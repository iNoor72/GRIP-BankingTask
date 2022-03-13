//
//  UserDetailsPresenter.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 13/03/2022.
//

import Foundation

protocol UserDetailsPresenterProtocol {
    
}

class UserDetailsPresenter: UserDetailsPresenterProtocol {
    weak var view: UserDetailsViewProtocol?
    
    init(view: UserDetailsViewProtocol) {
        self.view = view
    }
}
