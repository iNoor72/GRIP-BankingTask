//
//  UsersListViewController.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 10/03/2022.
//

import UIKit

class UsersListViewController: UIViewController {
    @IBOutlet private var usersTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users List"
        setupTableView()
    }
    
    private func setupTableView() {
        usersTableView.delegate = self
        usersTableView.dataSource = self
    }

}

//MARK:- Extensions

//MARK:- UITableView
extension UsersListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
        cell.textLabel?.text = "Noor"
        return cell
    }
    
    
}
