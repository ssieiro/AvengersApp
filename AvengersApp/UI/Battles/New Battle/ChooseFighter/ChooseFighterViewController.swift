//
//  ChooseFighterViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 30/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

protocol ChooseFighterViewControllerDelegate {
    func setHeroe(_ heroe: Heroe)
    func setVillain(_ villain: Villain)
}

class ChooseFighter: UIViewController {
    var delegate: ChooseFighterViewControllerDelegate?
    let dataProvider = DataProvider()
    var heroes: [Heroe] = []
    var villains: [Villain] = []
    var heroe: Heroe?
    var villain: Villain?
    var type: Int? = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fightersTableView.dataSource = self
        fightersTableView.delegate = self
        fightersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        fightersTableView.backgroundColor = UIColor.white
    }
    
    @IBOutlet weak var fightersTableView: UITableView!
    
    convenience init(withfighter fighter: Int){
        self.init(nibName: "ChooseFighterViewController", bundle: nil)
        if fighter == 1 {
            self.heroes = dataProvider.loadAllHeroes()
            self.type = 1
        }
        if fighter == 2 {
            self.villains = dataProvider.loadAllVillains()
            self.type = 2
        }
        
    }

    
}

extension ChooseFighter: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch type {
        case 1:
            delegate?.setHeroe(heroes[indexPath.row])
            self.dismiss(animated: true, completion: nil)
        case 2:
            delegate?.setVillain(villains[indexPath.row])
            self.dismiss(animated: true, completion: nil)
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
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fightersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        switch type {
        case 1:
            cell.contentView.backgroundColor = UIColor.init(red: 193/255.0, green: 210/255.0, blue: 243/255.0, alpha: 1.0)
            cell.textLabel?.text = heroes[indexPath.row].heroeName
//            let image = UIImage.init(named: heroes[indexPath.row].heroeImage ?? "")
//            let imageView = UIImageView.init(image: image)
//            imageView.contentMode = .scaleAspectFill
//            imageView.frame = CGRect(x: 10.0, y: 10.0, width: 50.0, height: 50.0)
            return cell
        case 2:
            cell.textLabel?.text = villains[indexPath.row].villainName
            cell.contentView.backgroundColor = UIColor.init(red: 222/255.0, green: 201/255.0, blue: 209/255.0, alpha: 1.0)
//            let image = UIImage.init(named: villains[indexPath.row].villainImage ?? "")
//            let imageView = UIImageView.init(image: image)
//            imageView.sizeThatFits(CGSize(width: 150, height: 150))
//            imageView.contentMode = .scaleAspectFill
            return cell
        default:
            fatalError("Could not create the Fighters cell")
        }
    }
    
    
}
