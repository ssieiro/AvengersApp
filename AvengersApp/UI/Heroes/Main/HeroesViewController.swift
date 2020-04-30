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
    private var heroes: [Heroe] = []
    
    @IBOutlet weak var heroesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.setData()
        self.updateAllData()
        
//        let dataProvider = DataProvider()
//        let prueba = dataProvider.loadAllBattles()
//        print ("\(String(describing: prueba[0].fighter1))")
//        print ("\(String(describing: prueba[1].fighter1))")
//        print ("\(String(describing: prueba[2].fighter1))")
//        print ("\(String(describing: prueba[0].fighter1))")
//        print ("\(String(describing: prueba[0].fighter2))")
//        print ("\(String(describing: prueba[0].winner))")
        
//        let dataProvider = DataProvider()
//        let prueba = dataProvider.loadHeroeBy(name: "Capitana Marvel")
//        print("\(String(describing: prueba[0].heroeName))")
//        print("\(String(describing: prueba))")
        

        
        
}
    
//  MARK: SetupUI
    
    func setupUI() {
        self.title = "Heroes"
        let nib = UINib.init(nibName: "HeroesTableViewCell", bundle: nil)
        heroesTableView.register(nib, forCellReuseIdentifier: "HeroesTableViewCell")
        self.heroesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        heroesTableView.delegate = self
        heroesTableView.dataSource = self
        
    }
    
    
    func setData () {
        if dataProvider.isFirstTime() {
            let dataSet = DataSet()
            dataSet.saveVillains()
            dataSet.saveHeroes()
            dataProvider.saveFirstTime()
        } else {return}
    }
    
    private func loadData () {
        let dataProvider = DataProvider()
        self.heroes = dataProvider.loadAllHeroes()
    }
    
    private func showData() {
        heroesTableView.reloadData()
    }
    
    private func updateAllData() {
        self.loadData()
        self.showData()
    }

    
}

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 236
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let heroe = heroes[indexPath.row]
        let heroesDetailVC = HeroesDetailViewController.init(withHeroe: heroe)
        heroesDetailVC.delegate = self
        self.navigationController?.pushViewController(heroesDetailVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesTableViewCell", for: indexPath) as? HeroesTableViewCell {
            let he = heroes [indexPath.row]
            cell.setHeroe(he)
            return cell
        }
fatalError("Could not create the Heroe cell")
    }
    
}

extension HeroesViewController: HeroesViewControllerDelegate {
    func didPowerChanged() {
        updateAllData()
    }
}
