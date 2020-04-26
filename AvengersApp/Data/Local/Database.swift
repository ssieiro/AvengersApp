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
    private let entityHeroeName = "heroeName"
    private let entityHeroeImage = "heroeImage"
    private let entityHeroeBio = "heroeBio"
    private let entityHeroePower = "heroePower"
    private let entityHeroeBattles = "battles"
    
    private let entityVillain = "Villain"
    private let entityVillainName = "villainName"
    private let entityVillainImage = "villainImage"
    private let entityVillainBio = "villainBio"
    private let entityVillainPower = "villainPower"
    private let entityVillainBattles = "battles"
    
    
    private let entityBattle = "Battle"
    private let entityBattleFighter1 = "fighter1Heroe"
    private let entityBattleFighter2 = "fighter2Villain"
    private let entityBattleWinner = "winner"
    
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
    
    func persistHeroe(_ heroe: Heroe) {
        guard let contextMOB = context() else {
            return
        }

        try? contextMOB.save()
    }
    
// Fetch
    
    func fecthAllData(_ entity: String) -> [NSManagedObject]? {
        return try? context()?.fetch(NSFetchRequest<NSFetchRequestResult>(entityName: entity)) as? [NSManagedObject]
    }
    
    func fetchDataBy(fighter: String, type: String) -> [NSManagedObject]? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityBattle)
        
        if type == "Heroe" {
            fetchRequest.predicate = NSPredicate(format: "fighter1Heroe = \(fighter)")
        } else {
           fetchRequest.predicate = NSPredicate(format: "fighter2Villain = \(fighter)")
        }
        
        return try? context()?.fetch(fetchRequest) as? [NSManagedObject]
    }
    

}

