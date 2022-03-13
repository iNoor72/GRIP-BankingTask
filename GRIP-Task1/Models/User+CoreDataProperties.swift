//
//  User+CoreDataProperties.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 13/03/2022.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var balance: Double
    @NSManaged public var email: String?
    @NSManaged public var name: String?
    @NSManaged public var transfer: Transfer?

}

extension User : Identifiable {

}
