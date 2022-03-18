//
//  UserDetailsRoutes.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 18/03/2022.
//

import Foundation
import UIKit

enum UserDetailsRoutes: Route {
    case TransferMoney(User)
    
    var destination: UIViewController {
        switch self {
        case .TransferMoney(let user):
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.ViewControllers.TransferMoneyViewController) as? TransferMoneyViewController else { return UIViewController() }
            vc.transferMoneyPresenter = TransferMoneyPresenter(view: vc, user: user, databaseManager: CoreDataManager(modelName: Constants.CoreDataModelName))
            return vc
        }
    }
    
    var style: NavigationStyle {
        switch self {
        case .TransferMoney(_):
            return .push
        }
    }
}

