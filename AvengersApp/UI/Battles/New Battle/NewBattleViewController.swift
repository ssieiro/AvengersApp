//
//  NewBattleViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 29/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

//MARK: Delegate protocol

protocol BattlesViewControllerDelegate: AnyObject {
    func didBattleAdded ()
}

class NewBattleViewController: UIViewController {
    
//    MARK: Properties
    
    weak var delegate: BattlesViewControllerDelegate?
    var battles: [Battle] = []
    let dataProvider = DataProvider()
    var fighter1: Heroe?
    var fighter2: Villain?
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.calculateID()
//        self.calculateWinner(fighter1power: 1, fighter2power: 1)
        self.title = "New battle"
        navigationItem.hidesBackButton = true
        self.setupUI()
    }
    
    convenience init(withBattles battles: [Battle]){
        self.init(nibName: "NewBattleViewController", bundle: nil)
        self.battles = battles
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "New Battle"
//        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 190/255.0, green: 232/255.0, blue: 107/255.0, alpha: 1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)

        // needed to clear the text in the back navigation:
        self.navigationItem.title = " "
//        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 131/255.0, green: 166/255.0, blue: 233/255.0, alpha: 1.0)
    }


    
//    MARK: IBOUTLET
    
    @IBOutlet weak var battleLabel: UILabel!
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var heroeAddButton: UIButton!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainAddButton: UIButton!
    @IBOutlet weak var battleIcon: UIImageView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
//    MARK: IBACTIONS
    
    @IBAction func addHeroe(_ sender: Any) {
        let chooseFighterVC = ChooseFighter.init(withfighter: 1)
        chooseFighterVC.delegate = self
        let navChooseVC = UINavigationController(rootViewController: chooseFighterVC)

        navChooseVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 26.0), .foregroundColor: UIColor.white]
        self.navigationController?.pushViewController(chooseFighterVC, animated: true)

    }
    @IBAction func addVillain(_ sender: Any) {
        let chooseFighterVC = ChooseFighter.init(withfighter: 2)
        chooseFighterVC.delegate = self
        let navChooseVC = UINavigationController(rootViewController: chooseFighterVC)


        navChooseVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 26.0), .foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 235/255.0, green: 117/255.0, blue: 100/255.0, alpha: 1.0)

        self.navigationController?.pushViewController(chooseFighterVC, animated: true)
    }
    
    @IBAction func createButton(_ sender: Any) {
        guard let fighter1 = fighter1 else {
            DispatchQueue.main.async { [weak self] in
                    self?.showAlert(title: "Error", message: "Please add a Heroe")
                }
            return
        }
        guard let fighter2 = fighter2 else {
            DispatchQueue.main.async { [weak self] in
                    self?.showAlert(title: "Error", message: "Please add a Villain")
                }
            return
        }
        
        self.createNewBattle(heroe: fighter1, villain: fighter2)
        delegate?.didBattleAdded()
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
            }
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    
    
//    MARK: ConfigureView
    
    func setupUI() {
        createButton.layer.cornerRadius = 15.0
        createButton.layer.shadowRadius = 2.0
        createButton.layer.shadowOpacity = 0.5
        createButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        createButton.layer.masksToBounds = false
        createButton.layer.shadowColor = UIColor.init(red: 6/255.0, green: 98/255.0, blue: 220/255.0, alpha: 1.0).cgColor
        
        cancelButton.layer.cornerRadius = 15.0
        cancelButton.layer.shadowRadius = 2.0
        cancelButton.layer.shadowOpacity = 0.5
        cancelButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        cancelButton.layer.masksToBounds = false
        cancelButton.layer.shadowColor = UIColor.darkGray.cgColor
        battleLabel.text = "Battle \(battles.count + 1)"
        
        heroeImage.alpha = 0.5
        villainImage.alpha = 0.5
        
    }
    
// MARK: Create Battle methods
    
    func calculateID() -> Int16 {
        battles = dataProvider.loadAllBattlesSortedById()
        let battlesID: [Int16] = battles.map({$0.id})
        guard let maxId = battlesID.max() else {return 1} // si no hay batallas el primer id será 1
        return maxId + 1
        
    }
    
    func calculateWinner(fighter1power: Int, fighter2power: Int) -> Int {
        let random = Int(arc4random_uniform(10) + 1)
        let fighter1 = random + fighter1power
        let fighter2 = random + fighter2power
        
        if fighter1 == fighter2 {
            let untie = Int(arc4random_uniform(2))
            if untie == 0 {return 1} else {return 2}
        }
        
        if fighter1 > fighter2 {return 1} else {return 2}

    }
    
    func createNewBattle (heroe: Heroe, villain: Villain) {
        let fight = calculateWinner(fighter1power: Int(heroe.heroePower), fighter2power: Int(villain.villainPower))
        
        var winner = ""
        
        if fight == 1 {
            winner = heroe.heroeName ?? ""
        }
        if fight == 2{
            winner = villain.villainName ?? ""
        }
        
        let newBattle = dataProvider.createBattle()
        let battleId = calculateID()
        
        newBattle?.setValue(heroe, forKey: "fighter1")
        newBattle?.setValue(villain, forKey: "fighter2")
        newBattle?.setValue(winner, forKey: "winner")
        newBattle?.setValue(battleId, forKey: "id")
        
        dataProvider.saveChanges()
    }
    
// MARK: Error manage
    
    func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
    
}

//MARK: Delegate methods

extension NewBattleViewController: ChooseFighterViewControllerDelegate {
    func setHeroe(_ heroe: Heroe) {
        self.fighter1 = heroe
        heroeAddButton.isHidden = true
        heroeImage.alpha = 1.0
        heroeImage.image = UIImage.init(named: fighter1?.heroeImage ?? "")
    }
    
    func setVillain(_ villain: Villain) {
        self.fighter2 = villain
        villainAddButton.isHidden = true
        villainImage.alpha = 1.0
        villainImage.image = UIImage.init(named: fighter2?.villainImage ?? "")
    }
    
}
