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
    
    var transferMoneyPresenter: TransferMoneyPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        confirmButton.layer.cornerRadius = 10.0
        usernameLabel.text = transferMoneyPresenter?.user?.name ?? ""
    }
    
    func checkAmountValidity() -> (Bool, Double) {
        guard let safeUserAmountEntry = amountTextField.text else { return (false, 0) }
        guard let moneyAmount = Double(safeUserAmountEntry) else { return (false, 0) }
        
        if moneyAmount > 0, moneyAmount < 10000 {
            return (true, moneyAmount)
        }
        return (false, 0)
    }
    
    @IBAction func confirmButtonTapped(_ sender: UIButton) {
        let result = checkAmountValidity()
        if result.0 {
            guard let safeManagedObjectContext = transferMoneyPresenter?.user?.managedObjectContext else { return }
            let transfer = Transfer(context: safeManagedObjectContext)
            transfer.receiver = transferMoneyPresenter?.user
            transfer.amount = result.1
            transferMoneyPresenter?.user?.balance += result.1
            
            //Save context
            do {
                try transferMoneyPresenter?.databaseManager?.managedObjectContext.save()
            } catch {
                print("There was an error saving your data. Error is: \(error.localizedDescription)")
            }
            
            guard let vc = storyboard?.instantiateViewController(withIdentifier: Constants.ViewControllers.UsersListViewController) as? UsersListViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        }
        
        
    }
    
}
