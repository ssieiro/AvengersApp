//
//  DataProvider.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 25/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import Foundation

class DataProvider {
    private var database: Database? = nil
    private var mUserPreferences: UserDefaultsPreferences? = nil
    private let entityHeroe = "Heroe"
    private let entityVillain = "Villain"
    private let entityBattle = "Battle"
    init() {
        database = Database()
        mUserPreferences = UserDefaultsPreferences()
    }
    
    deinit {
        database = nil
    }

    func isFirstTime() -> Bool {
        guard let answer = mUserPreferences?.isfirstTime() else {return false}
        return answer
    }
    
    func saveFirstTime() {
        mUserPreferences?.setFirstTime()
    }
    
    func createHeroe() -> Heroe? {
        return database?.createDataHeroe() as? Heroe
    }
    
    func createVillain() -> Villain? {
        return database?.createDataVillain() as? Villain
    }
    
    func createBattle() -> Battle? {
        return database?.createDataBattle() as? Battle
    }
    
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
    
    func loadAllBattles() -> [Battle] {
        guard let data = database?.fecthAllData(entityBattle) as? [Battle] else {
            return []
        }
        
        return data
    }
    
    func loadHeroeBattlesBy (fighter: String) -> [Battle] {
       return database?.fetchDataBy(fighter: fighter, type: entityHeroe) as? [Battle] ?? []
    }
    
    func loadVillainBattlesBy (fighter: String) -> [Battle] {
        return database?.fetchDataBy(fighter: fighter, type: entityVillain) as? [Battle] ?? []
    }
    
    func loadHeroeBy (name: String) -> [Heroe] {
        return database?.fetchDataBy(name: name, type: entityHeroe) as? [Heroe] ?? []

    }
    
    func loadVillainBy (name: String) -> [Villain] {
        return database?.fetchDataBy(name: name, type: entityVillain) as? [Villain] ?? []
    }
    
    func saveChanges() {
        database?.persistAll()
    }
    
    func saveHeroe (_ heroe: Heroe) {
        database?.persistHeroe(heroe)
    }
        
}
