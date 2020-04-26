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
        guard let capitanAmerica = dataProvider.createHeroe() else {return}
        let blackPanther = dataProvider.createHeroe()
        let laViudaNegra = dataProvider.createHeroe()
        let drStrange = dataProvider.createHeroe()
        let gamora = dataProvider.createHeroe()
        let hulk = dataProvider.createHeroe()
        let ironman = dataProvider.createHeroe()
        let capitanaMarvel = dataProvider.createHeroe()
        let spiderman = dataProvider.createHeroe()
        let thor = dataProvider.createHeroe()
        
//        capitanAmerica.setValue("Capitán América", forKey: "heroeName")
        capitanAmerica.heroeName = "Capitán América"
        capitanAmerica.heroeBio = "Descripción"
        capitanAmerica.heroeImage = "Baner_CapitanAmerica"
        capitanAmerica.heroePower = 4

        blackPanther?.heroeName = "Black Panther"
        blackPanther?.heroeBio = "Descripción"
        blackPanther?.heroeImage = "Baner_BlackPanther"
        blackPanther?.heroePower = 3

        laViudaNegra?.heroeName = "La Viuda Negra"
        laViudaNegra?.heroeBio = "Descripción"
        laViudaNegra?.heroeImage = "Baner_LaViudaNegra"
        laViudaNegra?.heroePower = 2
            
        drStrange?.heroeName = "Dr. Strange"
        drStrange?.heroeBio = "Descripción"
        drStrange?.heroeImage = "Baner_DrStrange"
        drStrange?.heroePower = 4
            
        gamora?.heroeName = "Gamora"
        gamora?.heroeBio = "Descripción"
        gamora?.heroeImage = "Baner_Gamora"
        gamora?.heroePower = 3
            
        hulk?.heroeName = "Hulk"
        hulk?.heroeBio = "Descripción"
        hulk?.heroeImage = "Baner_Hulk"
        hulk?.heroePower = 5
            
        ironman?.heroeName = "Iron Man"
        ironman?.heroeBio = "Descripción"
        ironman?.heroeImage = "Baner_Ironman"
        ironman?.heroePower = 3
            
        capitanaMarvel?.heroeName = "Capitana Marvel"
        capitanaMarvel?.heroeBio = "Descripción"
        capitanaMarvel?.heroeImage = "Baner_CapitanaMarvel"
        capitanaMarvel?.heroePower = 4
            
        spiderman?.heroeName = "Spiderman"
        spiderman?.heroeBio = "Descripción"
        spiderman?.heroeImage = "Baner_Spiderman"
        spiderman?.heroePower = 2

        thor?.heroeName = "Thor"
        thor?.heroeBio = "Descripción"
        thor?.heroeImage = "Baner_Thor"
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
        yonRogg?.villainImage = "Baner_Yon-Rogg"
        yonRogg?.villainPower = 2

        dormammu?.villainName = "Dormammu"
        dormammu?.villainBio = "Descripción"
        dormammu?.villainImage = "Baner_Dormammu"
        dormammu?.villainPower = 4
            
        ego?.villainName = "Ego"
        ego?.villainBio = "Descripción"
        ego?.villainImage = "Baner_Ego"
        ego?.villainPower = 2
            
        hela?.villainName = "Hela"
        hela?.villainBio = "Descripción"
        hela?.villainImage = "Baner_Hela"
        hela?.villainPower = 4
            
        ivanVanko?.villainName = "Ivan Vanko"
        ivanVanko?.villainBio = "Descripción"
        ivanVanko?.villainImage = "Baner_Ivan_Vanko"
        ivanVanko?.villainPower = 3
            
        johanSchmidt?.villainName = "Johann Schmidt"
        johanSchmidt?.villainBio = "Descripción"
        johanSchmidt?.villainImage = "Baner_Johann_Schmidt"
        johanSchmidt?.villainPower = 2
            
        malekith?.villainName = "Malekith"
        malekith?.villainBio = "Descripción"
        malekith?.villainImage = "Baner_Malekith"
        malekith?.villainPower = 3
            
        ronanElAcusador?.villainName = "Ronan El Acusador"
        ronanElAcusador?.villainBio = "Descripción"
        ronanElAcusador?.villainImage = "Baner_Ronan_El_Acusador"
        ronanElAcusador?.villainPower = 4
            
        thanos?.villainName = "Thanos"
        thanos?.villainBio = "Descripción"
        thanos?.villainImage = "Baner_Thanos"
        thanos?.villainPower = 5
            
        ultron?.villainName = "Ultron"
        ultron?.villainBio = "Descripción"
        ultron?.villainImage = "Baner_Ultron"
        ultron?.villainPower = 4
        
        dataProvider.saveChanges()
                                            
    }
    
}
