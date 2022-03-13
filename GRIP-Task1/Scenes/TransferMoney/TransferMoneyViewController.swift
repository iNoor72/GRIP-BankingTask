//
//  TransferMoneyViewController.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 10/03/2022.
//

import UIKit

class TransferMoneyViewController: UIViewController {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        confirmButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: Constants.ViewControllers.UsersListViewController) as? UsersListViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        navigationController?.present(vc, animated: true, completion: nil)
    }
    
}
