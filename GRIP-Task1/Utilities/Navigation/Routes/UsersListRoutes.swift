//
//  UsersListRoutes.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 18/03/2022.
//

import Foundation
import UIKit

enum UsersListRoutes: Route {
    case UserDetails(User)
    
    var destination: UIViewController {
        switch self {
        case .UserDetails(let user):
            guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.ViewControllers.UserDetailsViewController) as? UserDetailsViewController else { return UIViewController() }
            vc.userDetailsPresenter = UserDetailsPresenter(view: vc, user: user)
            return vc
        }
    }
    
    var style: NavigationStyle {
        switch self {
        case .UserDetails(_):
            return .push
        }
    }
}
