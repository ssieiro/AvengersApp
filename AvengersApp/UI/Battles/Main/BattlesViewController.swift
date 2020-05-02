//
//  BattlesViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 24/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//


import UIKit

class BattlesViewController: UIViewController {
    
//    MARK: Properties
    
    private var battles: [Battle] = []
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

    }


//    MARK: IBOUTLET
    
    @IBOutlet weak var battlesTableView: UITableView!
    @IBOutlet weak var createBattleButton: UIButton!
    
//    MARK: IBACTIONS
    
    @IBAction func createBattle(_ sender: Any) {
        let newBattleVC = NewBattleViewController.init(withBattles: battles)
        newBattleVC.delegate = self
        self.navigationController?.pushViewController(newBattleVC, animated: true)
    }
    
//  MARK: ConfigureView
    
    func setupUI() {
        self.loadData()
        self.showData()
        self.title = "New battle"
        
        createBattleButton.layer.cornerRadius = 15.0
        createBattleButton.layer.shadowRadius = 2.0
        createBattleButton.layer.shadowOpacity = 0.5
        createBattleButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        createBattleButton.layer.masksToBounds = false
        createBattleButton.layer.shadowColor = UIColor.init(red: 6/255.0, green: 98/255.0, blue: 220/255.0, alpha: 1.0).cgColor
        
        let nib = UINib.init(nibName: "BattlesTableViewCell", bundle: nil)
        battlesTableView.register(nib, forCellReuseIdentifier: "BattlesTableViewCell")
        
        self.battlesTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        battlesTableView.delegate = self
        battlesTableView.dataSource = self
        
    }
    
    private func loadData () {
        let dataProvider = DataProvider()
        self.battles = dataProvider.loadAllBattlesSortedById()
    }
    
    private func showData() {
        battlesTableView.reloadData()
    }
    
    private func updateAllData() {
        self.loadData()
        self.showData()
    }
    
    

}

// MARK: TableView Methods

extension BattlesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 178
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        false
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return battles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "BattlesTableViewCell", for: indexPath) as? BattlesTableViewCell {
            let bt = battles[indexPath.row]
            cell.setBattle(withBattle: bt)
            return cell
        }
fatalError("Could not create the Battle cell")
    }
    
}

//MARK: Delegate methods

extension BattlesViewController: BattlesViewControllerDelegate {
    func didBattleAdded() {
        self.loadData()
        self.showData()
    }
}
