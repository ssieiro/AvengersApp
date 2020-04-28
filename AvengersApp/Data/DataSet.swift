//
//  DataSet.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 26/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import Foundation

class DataSet {
    
    private let dataProvider = DataProvider()
    
    func saveHeroes () {
        let capitanAmerica = dataProvider.createHeroe()
        let blackPanther = dataProvider.createHeroe()
        let laViudaNegra = dataProvider.createHeroe()
        let drStrange = dataProvider.createHeroe()
        let gamora = dataProvider.createHeroe()
        let hulk = dataProvider.createHeroe()
        let ironman = dataProvider.createHeroe()
        let capitanaMarvel = dataProvider.createHeroe()
        let spiderman = dataProvider.createHeroe()
        let thor = dataProvider.createHeroe()
        
        capitanAmerica?.heroeName = "Capitán América"
        capitanAmerica?.heroeBio = "Descripción"
        capitanAmerica?.heroeImage = "img_heroe_america_captain"
        capitanAmerica?.heroePower = 4

        blackPanther?.heroeName = "Black Panther"
        blackPanther?.heroeBio = "Descripción"
        blackPanther?.heroeImage = "img_heroe_black_panther"
        blackPanther?.heroePower = 3

        laViudaNegra?.heroeName = "La Viuda Negra"
        laViudaNegra?.heroeBio = "Descripción"
        laViudaNegra?.heroeImage = "img_heroe_black_widow"
        laViudaNegra?.heroePower = 2
            
        drStrange?.heroeName = "Dr. Strange"
        drStrange?.heroeBio = "Descripción"
        drStrange?.heroeImage = "img_heroe_dr_strange"
        drStrange?.heroePower = 4
            
        gamora?.heroeName = "Gamora"
        gamora?.heroeBio = "Descripción"
        gamora?.heroeImage = "img_heroe_gamora"
        gamora?.heroePower = 3
            
        hulk?.heroeName = "Hulk"
        hulk?.heroeBio = "Descripción"
        hulk?.heroeImage = "img_heroe_hulk"
        hulk?.heroePower = 5
            
        ironman?.heroeName = "Iron Man"
        ironman?.heroeBio = "Descripción"
        ironman?.heroeImage = "img_heroe_ironman"
        ironman?.heroePower = 3
            
        capitanaMarvel?.heroeName = "Capitana Marvel"
        capitanaMarvel?.heroeBio = "Descripción"
        capitanaMarvel?.heroeImage = "img_heroe_marvel_captain"
        capitanaMarvel?.heroePower = 4
            
        spiderman?.heroeName = "Spiderman"
        spiderman?.heroeBio = "Descripción"
        spiderman?.heroeImage = "img_heroe_spiderman"
        spiderman?.heroePower = 2

        thor?.heroeName = "Thor"
        thor?.heroeBio = "Descripción"
        thor?.heroeImage = "img_heroe_thor"
        thor?.heroePower = 5
        
        dataProvider.saveChanges()
        
    }
    
    func saveVillains () {
        let yonRogg = dataProvider.createVillain()
        let dormammu = dataProvider.createVillain()
        let ego = dataProvider.createVillain()
        let hela = dataProvider.createVillain()
        let ivanVanko = dataProvider.createVillain()
        let johanSchmidt = dataProvider.createVillain()
        let malekith = dataProvider.createVillain()
        let ronanElAcusador = dataProvider.createVillain()
        let thanos = dataProvider.createVillain()
        let ultron = dataProvider.createVillain()
        
        yonRogg?.villainName = "Yon-Rogg"
        yonRogg?.villainBio = "Descripción"
        yonRogg?.villainImage = "img_heroe_yon_rogg"
        yonRogg?.villainPower = 2

        dormammu?.villainName = "Dormammu"
        dormammu?.villainBio = "Descripción"
        dormammu?.villainImage = "img_villain_dormammu"
        dormammu?.villainPower = 4
            
        ego?.villainName = "Ego"
        ego?.villainBio = "Descripción"
        ego?.villainImage = "img_villain_ego"
        ego?.villainPower = 2
            
        hela?.villainName = "Hela"
        hela?.villainBio = "Descripción"
        hela?.villainImage = "img_villain_hela"
        hela?.villainPower = 4
            
        ivanVanko?.villainName = "Ivan Vanko"
        ivanVanko?.villainBio = "Descripción"
        ivanVanko?.villainImage = "img_villain_ivan_vanko"
        ivanVanko?.villainPower = 3
            
        johanSchmidt?.villainName = "Johann Schmidt"
        johanSchmidt?.villainBio = "Descripción"
        johanSchmidt?.villainImage = "img_villain_johann_schmidt"
        johanSchmidt?.villainPower = 2
            
        malekith?.villainName = "Malekith"
        malekith?.villainBio = "Descripción"
        malekith?.villainImage = "img_villain_malekith"
        malekith?.villainPower = 3
            
        ronanElAcusador?.villainName = "Ronan El Acusador"
        ronanElAcusador?.villainBio = "Descripción"
        ronanElAcusador?.villainImage = "img_villain_ronan"
        ronanElAcusador?.villainPower = 4
            
        thanos?.villainName = "Thanos"
        thanos?.villainBio = "Descripción"
        thanos?.villainImage = "img_villain_thanos"
        thanos?.villainPower = 5
            
        ultron?.villainName = "Ultron"
        ultron?.villainBio = "Descripción"
        ultron?.villainImage = "img_villain_ultron"
        ultron?.villainPower = 4
        
        dataProvider.saveChanges()
                                            
    }
    
    func saveExampleBattles () {
        let heroes = dataProvider.loadAllHeroes()
        let villains = dataProvider.loadAllVillains()
        let battle1 = dataProvider.createBattle()
        let battle2 = dataProvider.createBattle()
        let battle3 = dataProvider.createBattle()
        
        battle1?.setValue(heroes[0], forKey: "fighter1")
        battle1?.setValue(villains[0], forKey: "fighter2")
        battle1?.setValue(heroes[0].heroeName, forKey: "winner")
        
        battle2?.setValue(heroes[0], forKey: "fighter1")
        battle2?.setValue(villains[0], forKey: "fighter2")
        battle2?.setValue(villains[0].villainName, forKey: "winner")
        
        battle3?.setValue(heroes[0], forKey: "fighter1")
        battle3?.setValue(villains[0], forKey: "fighter2")
        battle3?.setValue(villains[0].villainName, forKey: "winner")
        
        dataProvider.saveChanges()

    }
    
}
