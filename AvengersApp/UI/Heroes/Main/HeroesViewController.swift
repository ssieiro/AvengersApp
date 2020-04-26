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
        self.setData() // solo la primera vez
        self.updateAllData()
        
//        guard let capitanAmerica = dataProvider.createHeroe() else {return}
//        capitanAmerica.heroeName = "Capitán América"
//        let heroes = dataProvider.loadAllHeroes()
//        dataProvider.saveChanges()
//        print ("\(String(describing: heroes[0]))")
//        print ("\(String(describing: heroes[0].heroeName))")
        
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
        let dataSet = DataSet()
        dataSet.saveVillains()
//        print ("\(String(describing: villains))")
        dataSet.saveHeroes()
//        print ("\(String(describing: heroes))")
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
// cuando seleccionemos la tabla para ir al detalle
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesTableViewCell", for: indexPath) as? HeroesTableViewCell {
            let he = heroes [indexPath.row]
            cell.setHeroe(he)
            cell.delegate = self
            return cell
        }
fatalError("Could not create the Episode cell")
    }
    
    
}

extension HeroesViewController: HeroeCellDelegate {
    func didPowerChanged(_ heroe: Heroe?) {
        updateAllData()
    }
    
    
}
