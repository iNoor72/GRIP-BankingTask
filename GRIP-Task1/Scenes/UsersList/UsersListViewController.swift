//
//  UsersListViewController.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 10/03/2022.
//

import UIKit

protocol UsersListViewProtocol: AnyObject {
    
}

class UsersListViewController: UIViewController, UsersListViewProtocol {
    @IBOutlet private var usersTableView: UITableView!
    
    let coreDataManager = CoreDataManager(modelName: Constants.CoreDataModelName)
    var usersPresenter: UsersPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users List"
        usersPresenter = UsersPresenter(view: self, users: coreDataManager.setDummyData())
        setupTableView()
    }
    
    private func setupTableView() {
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UINib(nibName: Constants.NibNames.UserCellNibName, bundle: nil), forCellReuseIdentifier: Constants.Cells.UserInfoCell)
    }

}

//MARK:- Extensions

//MARK:- UITableView
extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.UserInfoCell) as? UserInfoTableViewCell else { return UITableViewCell() }
        cell.usernameLabel.text = usersPresenter.users[indexPath.row].name
        cell.emailLabel.text = usersPresenter.users[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
