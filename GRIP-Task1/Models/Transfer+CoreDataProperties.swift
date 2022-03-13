//
//  Transfer+CoreDataProperties.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 13/03/2022.
//
//

import Foundation
import CoreData


extension Transfer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transfer> {
        return NSFetchRequest<Transfer>(entityName: "Transfer")
    }

    @NSManaged public var sender: User?
    @NSManaged public var receiver: User?
    @NSManaged public var amount: Double
    @NSManaged public var ofUser: User?

}

extension Transfer : Identifiable {

}
