//
//  BattlesTableViewCell.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 29/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit



class BattlesTableViewCell: UITableViewCell {
    
//    MARK: Properties
    
    weak var delegate: BattlesViewControllerDelegate?
    private var battle: Battle?
    
//    MARK: Lifecycle methods
    
    override func awakeFromNib() {
        heroeImage.layer.cornerRadius = 15
        heroeImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        heroeImage.layer.borderWidth = 4.0
        villainImage.layer.cornerRadius = 15
        villainImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        villainImage.layer.borderWidth = 4.0
        }

    override func prepareForReuse() {
        battle = nil
        }
    
//    MARK: IBOUTLET
    
    @IBOutlet weak var heroeImage: UIImageView!
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var battleIcon: UIImageView!
    @IBOutlet weak var battleNumberLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
// MARK: IBACTION
    
    @IBAction func deleteBattle(_ sender: Any) {
        print("button pressed")
        let dataProvider = DataProvider()
        dataProvider.deleteBattleById(id: Int(battle?.id ?? 0))
        delegate?.didBattlesChanged()
    }
    

    
//  MARK: ConfigureView
    
    func setBattle (withBattle battle: Battle) {
        self.battle = battle
        heroeImage.image = UIImage.init(named: battle.fighter1?.heroeImage ?? "")
        villainImage.image = UIImage.init(named: battle.fighter2?.villainImage ?? "")
        battleNumberLabel.text = "Battle \(battle.id)"
        
        if battle.fighter1?.heroeName == battle.winner {
            heroeImage.layer.borderColor = UIColor.init(red: 12/255.0, green: 156/255.0, blue: 43/255.0, alpha: 1.0).cgColor
        } else {
            heroeImage.layer.borderColor = UIColor.init(red: 155/255.0, green: 28/255.0, blue: 42/255.0, alpha: 1.0).cgColor
        }
        if battle.fighter2?.villainName == battle.winner {
            villainImage.layer.borderColor = UIColor.init(red: 12/255.0, green: 156/255.0, blue: 43/255.0, alpha: 1.0).cgColor
        } else {
            villainImage.layer.borderColor = UIColor.init(red: 155/255.0, green: 28/255.0, blue: 42/255.0, alpha: 1.0).cgColor
        }
    }
}
