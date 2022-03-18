//
//  UserInfoTableViewCell.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 12/03/2022.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    @IBOutlet private weak var userImage: UIImageView!
    @IBOutlet private weak var usernameLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var balanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(user: User) {
        userImage.image = UIImage(systemName: "person")
        usernameLabel.text = user.name
        emailLabel.text = user.email
        balanceLabel.text = "\(user.balance)"
    }
}
