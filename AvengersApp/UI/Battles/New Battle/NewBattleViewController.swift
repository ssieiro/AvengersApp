//
//  NewBattleViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 29/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

protocol BattlesViewControllerDelegate: AnyObject {
    func didBattleAdded ()
}

class NewBattleViewController: UIViewController {
    
    weak var delegate: BattlesViewControllerDelegate?
    var battles: [Battle] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New battle"
        navigationItem.hidesBackButton = true
        self.setupUI()
    }
    
    convenience init(withBattles battles: [Battle]){
        self.init(nibName: "NewBattleViewController", bundle: nil)
        self.battles = battles
        
    }

//    MARK: IBOUTLET
    @IBOutlet weak var battleLabel: UILabel!
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var heroeAddButton: UIButton!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var villainAddButton: UIImageView!
    @IBOutlet weak var battleIcon: UIImageView!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    
//    MARK: IBACTIONS
    
    @IBAction func createButton(_ sender: Any) {
//        let dataProvider = DataProvider()
        
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
        
    }

    

}
