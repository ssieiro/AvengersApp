//
//  ChooseFighterViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 30/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

//MARK: Delegate protocol

protocol ChooseFighterViewControllerDelegate {
    func setHeroe(_ heroe: Heroe)
    func setVillain(_ villain: Villain)
}

class ChooseFighter: UIViewController {
    
//    MARK: Properties
    
    var delegate: ChooseFighterViewControllerDelegate?
    let dataProvider = DataProvider()
    var heroes: [Heroe] = []
    var villains: [Villain] = []
    var heroe: Heroe?
    var villain: Villain?
    var type: Int? = 0
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fightersTableView.dataSource = self
        fightersTableView.delegate = self
        fightersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.setupUI()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)

        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 131/255.0, green: 166/255.0, blue: 233/255.0, alpha: 1.0)
    }
    
    convenience init(withfighter fighter: Int){
        self.init(nibName: "ChooseFighterViewController", bundle: nil)
        if fighter == 1 {
            self.heroes = dataProvider.loadAllHeroes()
            self.type = 1
            self.title = "Choose Heroe"
        }
        if fighter == 2 {
            self.villains = dataProvider.loadAllVillains()
            self.type = 2
            self.title = "Choose Villain"
        }
    }
    
    
//    MARK: IBOutlet
    
    @IBOutlet weak var fightersTableView: UITableView!
  
//    MARK: ConfigureView
    
    func setupUI() {
        fightersTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        switch type {
        case 1:
            fightersTableView.backgroundColor = UIColor.init(red: 193/255.0, green: 210/255.0, blue: 243/255.0, alpha: 1.0)
        case 2:
            fightersTableView.backgroundColor = UIColor.init(red: 222/255.0, green: 201/255.0, blue: 209/255.0, alpha: 1.0)
        default:
            return
        }
    }
}

// MARK: TableView Methods

extension ChooseFighter: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch type {
        case 1:
            delegate?.setHeroe(heroes[indexPath.row])
            navigationController?.popViewController(animated: true)
        case 2:
            delegate?.setVillain(villains[indexPath.row])
            navigationController?.popViewController(animated: true)
        default:
            return
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch type {
        case 1:
            return heroes.count
        case 2:
            return villains.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fightersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        switch type {
        case 1:
            cell.contentView.backgroundColor = UIColor.init(red: 193/255.0, green: 210/255.0, blue: 243/255.0, alpha: 1.0)
            cell.textLabel?.text = "\(heroes[indexPath.row].heroeName ?? "") - Power: \(heroes[indexPath.row].heroePower)"
            let image = UIImage.init(named: heroes[indexPath.row].heroeImage ?? "")
            cell.imageView?.image = image
            cell.imageView?.contentMode = .scaleAspectFill
            return cell
        case 2:
            cell.textLabel?.text = "\(villains[indexPath.row].villainName ?? "") - Power: \(villains[indexPath.row].villainPower)"
            cell.contentView.backgroundColor = UIColor.init(red: 222/255.0, green: 201/255.0, blue: 209/255.0, alpha: 1.0)
            let image = UIImage.init(named: villains[indexPath.row].villainImage ?? "")
            cell.imageView?.image = image
            cell.imageView?.contentMode = .scaleAspectFill
            return cell
        default:
            fatalError("Could not create the Fighters cell")
        }
    }
    
    
}
