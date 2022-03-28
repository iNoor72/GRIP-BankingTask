//
//  UsersListViewController.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 10/03/2022.
//

import UIKit

protocol UsersListViewProtocol: AnyObject, NavigationRoute {
    func reloadData()
}

class UsersListViewController: UIViewController, UsersListViewProtocol {
    @IBOutlet private var usersTableView: UITableView!
    var usersPresenter: UsersPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users List"
        setupTableView()
        usersPresenter = UsersPresenter(view: self, users: CoreDataManager.shared.fetchUsersData())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
    }
    
    private func setupTableView() {
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UINib(nibName: Constants.NibNames.UserCellNibName, bundle: nil), forCellReuseIdentifier: Constants.Cells.UserInfoCell)
    }
    
    internal func reloadData() {
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
    }

}

//MARK:- Extensions

//MARK:- UITableView
extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usersPresenter?.users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Cells.UserInfoCell) as? UserInfoTableViewCell else { return UITableViewCell() }
        guard let user = usersPresenter?.users?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        usersPresenter?.navigateToUser(at: indexPath.row)
    }
    
    
}
