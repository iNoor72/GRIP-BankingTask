//
//  TransferMoneyViewController.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 10/03/2022.
//

import UIKit

protocol TransferMoneyViewProtocol: AnyObject {
    
}

class TransferMoneyViewController: UIViewController, TransferMoneyViewProtocol {
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var amountTextField: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var presenter: TransferMoneyPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        confirmButton.layer.cornerRadius = 10.0
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
    }
    
}
