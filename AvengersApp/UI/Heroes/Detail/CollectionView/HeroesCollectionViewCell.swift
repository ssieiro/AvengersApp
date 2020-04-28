//
//  HeroesCollectionViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 28/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit
 
class HeroesCollectionViewCell: UICollectionViewCell {
    
    private var battle: Battle?
    private var heroe: Heroe?
    
    @IBOutlet weak var battleLabel: UILabel!
    
    override func prepareForReuse() {
        heroe = nil
        battle = nil
       }
    
    override func awakeFromNib() {
        battleLabel.layer.cornerRadius = 15.0
        battleLabel.layer.shadowColor = UIColor.black.cgColor
        battleLabel.layer.shadowRadius = 3.0
        battleLabel.layer.shadowOpacity = 1.0
        battleLabel.layer.shadowOffset = CGSize(width: 4, height: 4)
        battleLabel.layer.masksToBounds = false
    }
    
    func setBattle(battle: Battle, heroe: Heroe) {
         print ("\(String(describing: battle))")
//        print ("\(String(describing: battle.fighter2))")
//        print ("\(String(describing: battle.winner))")
//        print ("\(String(describing: heroe.heroeName))")
        if heroe.heroeName == battle.winner {
        battleLabel.backgroundColor = UIColor.init(red: 6/255.0, green: 98/255.0, blue: 220/255.0, alpha: 1.0)
        }
        battleLabel.text = "Battle 1"
    }
 
}
