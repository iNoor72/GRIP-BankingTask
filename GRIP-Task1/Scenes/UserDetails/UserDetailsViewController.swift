//
//  UserDetailsViewController.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 10/03/2022.
//

import UIKit

protocol UserDetailsViewProtocol: AnyObject {
    
}

class UserDetailsViewController: UIViewController, UserDetailsViewProtocol {
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var transferButton: UIButton!
    
    var userDetailsPresenter: UserDetailsPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDetailsPresenter = UserDetailsPresenter(view: self)
        setupUI()
    }
    
    private func setupUI() {
        transferButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func transferButtonTapped(_ sender: UIButton) {
    }
}
