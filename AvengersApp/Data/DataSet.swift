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
        
        capitanAmerica?.heroeName = "Captain America"
        capitanAmerica?.heroeBio = "Recipient of the Super-Soldier serum, World War II hero Steve Rogers fights for American ideals as one of the world’s mightiest heroes and the leader of the Avengers."
        capitanAmerica?.heroeImage = "img_heroe_america_captain"
        capitanAmerica?.heroePower = 4

        blackPanther?.heroeName = "Black Panther"
        blackPanther?.heroeBio = "T’Challa is the king of the secretive and highly advanced African nation of Wakanda - as well as the powerful warrior known as the Black Panther."
        blackPanther?.heroeImage = "img_heroe_black_panther"
        blackPanther?.heroePower = 3

        laViudaNegra?.heroeName = "Black Widow"
        laViudaNegra?.heroeBio = "Despite super spy Natasha Romanoff’s checkered past, she’s become one of S.H.I.E.L.D.’s most deadly assassins and a frequent member of the Avengers."
        laViudaNegra?.heroeImage = "img_heroe_black_widow"
        laViudaNegra?.heroePower = 2
            
        drStrange?.heroeName = "Dr. Strange"
        drStrange?.heroeBio = "Formerly a renowned surgeon, Doctor Stephen Strange now serves as the Sorcerer Supreme—Earth’s foremost protector against magical and mystical threats."
        drStrange?.heroeImage = "img_heroe_dr_strange"
        drStrange?.heroePower = 4
            
        gamora?.heroeName = "Gamora"
        gamora?.heroeBio = "Raised by Thanos to be a living weapon, Gamora seeks redemption as a member of the Guardians of the Galaxy, putting her extraordinary fighting abilities to good use."
        gamora?.heroeImage = "img_heroe_gamora"
        gamora?.heroePower = 3
            
        hulk?.heroeName = "Hulk"
        hulk?.heroeBio = "Dr. Bruce Banner lives a life caught between the soft-spoken scientist he’s always been and the uncontrollable green monster powered by his rage."
        hulk?.heroeImage = "img_heroe_hulk"
        hulk?.heroePower = 5
            
        ironman?.heroeName = "Iron Man"
        ironman?.heroeBio = "Genius. Billionaire. Playboy. Philanthropist. Tony Stark's confidence is only matched by his high-flying abilities as the hero called Iron Man."
        ironman?.heroeImage = "img_heroe_ironman"
        ironman?.heroePower = 3
            
        capitanaMarvel?.heroeName = "Captain Marvel"
        capitanaMarvel?.heroeBio = "Carol Danvers becomes one of the universe's most powerful heroes when Earth is caught in the middle of a galactic war between two alien races."
        capitanaMarvel?.heroeImage = "img_heroe_marvel_captain"
        capitanaMarvel?.heroePower = 4
            
        spiderman?.heroeName = "Spiderman"
        spiderman?.heroeBio = "Bitten by a radioactive spider, Peter Parker’s arachnid abilities give him amazing powers he uses to help others, while his personal life continues to offer plenty of obstacles."
        spiderman?.heroeImage = "img_heroe_spiderman"
        spiderman?.heroePower = 2

        thor?.heroeName = "Thor"
        thor?.heroeBio = "The son of Odin uses his mighty abilities as the God of Thunder to protect his home Asgard and planet Earth alike."
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
        yonRogg?.villainBio = "As the leader of a squad of elite Kree soldiers, Yon-Rogg takes newly-recruited Carol Danvers under his wing and trains her."
        yonRogg?.villainImage = "img_heroe_yon_rogg"
        yonRogg?.villainPower = 2

        dormammu?.villainName = "Dormammu"
        dormammu?.villainBio = "Originating in the aptly-named Dark Dimension, this incredibly powerful being has ominous plans for Earth and those who live there."
        dormammu?.villainImage = "img_villain_dormammu"
        dormammu?.villainPower = 4
            
        ego?.villainName = "Ego"
        ego?.villainBio = "Ancient and unbelievably powerful, Ego has the power of an entire planet at his disposal."
        ego?.villainImage = "img_villain_ego"
        ego?.villainPower = 2
            
        hela?.villainName = "Hela"
        hela?.villainBio = "With family ties to the rulers of Asgard, Hela seeks power (and followers) for herself."
        hela?.villainImage = "img_villain_hela"
        hela?.villainPower = 4
            
        ivanVanko?.villainName = "Ivan Vanko"
        ivanVanko?.villainBio = "Descripción"
        ivanVanko?.villainImage = "img_villain_ivan_vanko"
        ivanVanko?.villainPower = 3
            
        johanSchmidt?.villainName = "Red Skull"
        johanSchmidt?.villainBio = "Rising to power during World War II, Johann Schmidt become one of Earth’s most dangerous threats and one of Captain America’s greatest enemies.n"
        johanSchmidt?.villainImage = "img_villain_johann_schmidt"
        johanSchmidt?.villainPower = 2
            
        malekith?.villainName = "Malekith"
        malekith?.villainBio = "The Dark Elf of Svartalfheim, Malekith uses his magic and trickery to bring war to all of the Ten Realms."
        malekith?.villainImage = "img_villain_malekith"
        malekith?.villainPower = 3
            
        ronanElAcusador?.villainName = "Ronan The Accuser"
        ronanElAcusador?.villainBio = "As a cruel and fanatical member of the Kree race, Ronan double-crossed Thanos in an attempt to keep the Power Stone for himself."
        ronanElAcusador?.villainImage = "img_villain_ronan"
        ronanElAcusador?.villainPower = 4
            
        thanos?.villainName = "Thanos"
        thanos?.villainBio = "The Mad Titan Thanos quests across the universe in search of the Infinity Stones, intending to use their limitless power for shocking purposes."
        thanos?.villainImage = "img_villain_thanos"
        thanos?.villainPower = 5
            
        ultron?.villainName = "Ultron"
        ultron?.villainBio = "The creation gone awry, the sentient robot Ultron hates and seeks to wipe out humanity."
        ultron?.villainImage = "img_villain_ultron"
        ultron?.villainPower = 4
        
        dataProvider.saveChanges()
                                            
    }
    
}
