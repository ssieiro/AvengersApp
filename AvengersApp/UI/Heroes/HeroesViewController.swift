//
//  ViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 24/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

class HeroesViewController: UIViewController {

    private let dataProvider = DataProvider()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Heroes"
        self.saveData()
//        guard let capitanAmerica = dataProvider.createHeroe() else {return}
//        capitanAmerica.heroeName = "Capitán América"
//        let heroes = dataProvider.loadAllHeroes()
//        dataProvider.saveChanges()
//        print ("\(String(describing: heroes[0]))")
//        print ("\(String(describing: heroes[0].heroeName))")
        
}
    
            func saveData () {
            let dataSet = DataSet()
            let dataProvider = DataProvider()
    
            dataSet.saveVillains()
            let villains = dataProvider.loadAllVillains()
            print ("\(String(describing: villains))")
            dataSet.saveHeroes()
            let heroes = dataProvider.loadAllHeroes()
            print ("\(String(describing: heroes))")

    //        self.navigationController?.isNavigationBarHidden = true
        }
    
@IBOutlet weak var heroes: UILabel!
}
