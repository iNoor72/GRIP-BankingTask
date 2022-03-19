//
//  CoreDataManager.swift
//  GRIP-Task1
//
//  Created by Noor Walid on 11/03/2022.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager(modelName: Constants.CoreDataModelName)
    var names = ["Arthur", "Ford", "Trillian", "Zaphod", "Marvin","Noor","Saber","Mo","Walid","Alex"]
    var emails = ["Arthur@mail.com", "Ford@mail.com", "Trillian@mail.com", "Zaphod@mail.com", "Marvin@mail.com","Noor@mail.com","Saber@mail.com","Mo@mail.com","Walid@mail.com","Alex@mail.com"]
    var balances = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
    
    private let modelName: String
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
        
        let fileManager = FileManager.default
        let storeName = "\(self.modelName).sqlite"
        
        let documentsDirectoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        
        let persistentStoreURL = documentsDirectoryURL.appendingPathComponent(storeName)
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType,
                                                              configurationName: nil,
                                                              at: persistentStoreURL,
                                                              options: nil)
        } catch {
            fatalError("Unable to Load Persistent Store")
        }
        
        return persistentStoreCoordinator
    }()
    
    private(set) lazy var managedObjectContext: NSManagedObjectContext = {
        let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator
        
        return managedObjectContext
    }()
    
    private lazy var managedObjectModel: NSManagedObjectModel = {
        guard let modelURL = Bundle.main.url(forResource: self.modelName, withExtension: "momd") else {
            fatalError("Unable to Find Data Model")
        }
        
        guard let managedObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Unable to Load Data Model")
        }
        
        return managedObjectModel
    }()
    
    private init(modelName: String) {
        self.modelName = modelName
    }
    
    func setDummyData() {
        var objects = [User]()
        for _ in 0..<10 {
            let object = User(context: managedObjectContext)
            object.name = names.removeFirst()
            object.email = emails.removeFirst()
            object.balance = balances.removeFirst()
            print(object.balance)
            objects.append(object)
            do { try managedObjectContext.save()
            } catch {
                print("There was an error saving your data. Error is: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchUsersData() -> [User] {
        do {
            let users = try managedObjectContext.fetch(NSFetchRequest(entityName: "User")) as [User]
            return users
        } catch {
            print("There was an error fetchiing your users data. Error is: \(error.localizedDescription)")
        }
        
        return [User]()
    }
    
    func deleteAllUsers() {
        for object in managedObjectContext.insertedObjects {
            do {
                let objectToDelete = try managedObjectContext.existingObject(with: object.objectID)
                    managedObjectContext.delete(objectToDelete)
            } catch {
                print("There was an error deleting your users data. Error is: \(error.localizedDescription)")
            }
        }
    }
    
}
