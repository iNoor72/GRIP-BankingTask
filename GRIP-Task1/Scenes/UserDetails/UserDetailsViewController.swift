//
//  UserDetailsViewController.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 10/03/2022.
//

import UIKit
import CoreData

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
        setupUI()
    }
    
    private func setupUI() {
        transferButton.layer.cornerRadius = 10.0
        userImage.image = UIImage(systemName: "person")
        usernameLabel.text = userDetailsPresenter?.user?.name ?? ""
        balanceLabel.text = "\(userDetailsPresenter?.user?.balance ?? 0)"
    }
    
    @IBAction func transferButtonTapped(_ sender: UIButton) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: Constants.ViewControllers.TransferMoneyViewController) as? TransferMoneyViewController else { return }
        vc.transferMoneyPresenter = TransferMoneyPresenter(view: vc, user: userDetailsPresenter?.user ?? User(context: NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)), databaseManager: CoreDataManager.shared)
        navigationController?.pushViewController(vc, animated: true)
    }
}
