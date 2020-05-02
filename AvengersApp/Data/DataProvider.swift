//
//  DataProvider.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 25/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import Foundation

class DataProvider {
    
//    MARK: Properties
    
    private var database: Database? = nil
    private var mUserPreferences: UserDefaultsPreferences? = nil
    private let entityHeroe = "Heroe"
    private let entityVillain = "Villain"
    private let entityBattle = "Battle"
    
//    MARK: Lifecicle methods
    
    init() {
        database = Database()
        mUserPreferences = UserDefaultsPreferences()
    }
    
    deinit {
        database = nil
    }

// MARK: User Defaults methods
    
    func isFirstTime() -> Bool {
        guard let answer = mUserPreferences?.isfirstTime() else {return false}
        return answer
    }
    
    func saveFirstTime() {
        mUserPreferences?.setFirstTime()
    }
    
//    MARK: Dataprovider methods
    
//    create methods
    
    func createHeroe() -> Heroe? {
        return database?.createDataHeroe() as? Heroe
    }
    
    func createVillain() -> Villain? {
        return database?.createDataVillain() as? Villain
    }
    
    func createBattle() -> Battle? {
        return database?.createDataBattle() as? Battle
    }
    
//    load methods
    
    func loadAllHeroes() -> [Heroe] {
        guard let data = database?.fecthAllData(entityHeroe) as? [Heroe] else {
            return []
        }
        
        return data
    }
    
    func loadAllVillains() -> [Villain] {
        guard let data = database?.fecthAllData(entityVillain) as? [Villain] else {
            return []
        }
        
        return data
    }
    
    func loadAllBattlesSortedById() -> [Battle] {
        guard let data = database?.fetchBattlesSortedbyId() as? [Battle] else {
            return []
        }
        return data
    }
    
    func deleteBattleById (id: Int) {
        database?.deleteBattlebyId(battleId: id)
        return
    }
    
//    save methods
    
    func saveChanges() {
        database?.persistAll()
    }
        
}
