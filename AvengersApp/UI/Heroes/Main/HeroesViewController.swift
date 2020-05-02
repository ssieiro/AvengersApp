//
//  ViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 24/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

class HeroesViewController: UIViewController {
    
//    MARK: Properties

    private let dataProvider = DataProvider()
    private var heroes: [Heroe] = []
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setData()
        self.updateAllData()
        self.setupUI()
        
}
    
//    MARK: IBOUTLET

    @IBOutlet weak var heroesTableView: UITableView!

    
//  MARK: ConfigureView
    
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

// MARK: TableView Methods

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 236
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

//MARK: Delegate methods

extension HeroesViewController: HeroesViewControllerDelegate {
    func didPowerChanged() {
        updateAllData()
    }
}
