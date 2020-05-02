//
//  Database.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 25/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit
import CoreData

class Database {
    
//    MARK: Properties
    
    private let entityHeroe = "Heroe"
    private let entityVillain = "Villain"
    private let entityBattle = "Battle"
    private let entityBattleID = "id"
    
// MARK: - Managed Object Context
    
    private func context() -> NSManagedObjectContext? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
         
        return appDelegate.persistentContainer.viewContext
    }

// MARK: Database methods

//    create methods
    
    func createDataHeroe() -> NSManagedObject? {
        guard let contextMOB = context(),
              let entity = NSEntityDescription.entity(forEntityName: entityHeroe,
                                                      in: contextMOB) else {
            return nil
        }
        
        return Heroe(entity: entity,
                    insertInto: context())
    }
    
    func createDataVillain() -> NSManagedObject? {
        guard let contextMOB = context(),
              let entity = NSEntityDescription.entity(forEntityName: entityVillain,
                                                      in: contextMOB) else {
            return nil
        }
        
        return Villain(entity: entity,
                    insertInto: context())
    }
    
    func createDataBattle() -> NSManagedObject? {
        guard let contextMOB = context(),
              let entity = NSEntityDescription.entity(forEntityName: entityBattle,
                                                      in: contextMOB) else {
            return nil
        }
        
        return Battle(entity: entity,
                    insertInto: context())
    }
    
// persist methods

    func persistAll() {
        guard let contextMOB = context() else {
            return
        }

        try? contextMOB.save()
    }
    
    
// fetch methods
    
    func fecthAllData(_ entity: String) -> [NSManagedObject]? {
        return try? context()?.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: entity)) as? [NSManagedObject]
    }
    
    func fetchBattlesSortedbyId() -> [NSManagedObject]?{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityBattle) 
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: entityBattleID, ascending: true)]
        return try? context()?.fetch(fetchRequest)
    }
        

//    func fetchDataBy (name: String, type: String) -> [NSManagedObject]? {
//            if type == entityHeroe {
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityHeroe)
//                let heroePredicate = NSPredicate(format: "heroeName = \(name)")
//                fetchRequest.predicate = heroePredicate
//                return try? context()?.fetch(fetchRequest) as? [NSManagedObject]
//            } else {
//                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityVillain)
//                let villainPredicate = NSPredicate(format: "villainName = \(name)")
//                fetchRequest.predicate = villainPredicate
//                return try? context()?.fetch(fetchRequest) as? [NSManagedObject]
//            }
//            
//        }

}

