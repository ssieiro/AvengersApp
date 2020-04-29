//
//  HeroesCollectionViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 28/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit
 
class VillainsCollectionViewCell: UICollectionViewCell {
    
    private var battle: Battle?
    private var villain: Villain?
    
    @IBOutlet weak var battleLabel: UILabel!
    
    override func prepareForReuse() {
        villain = nil
        battle = nil
       }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10.0
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 1.0
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.masksToBounds = false
    }
    
    func setBattle(battle: Battle, villain: Villain) {
        if villain.villainName == battle.winner {
            self.backgroundColor = UIColor.init(red: 12/255.0, green: 156/255.0, blue: 43/255.0, alpha: 1.0)
            self.layer.shadowColor = UIColor.init(red: 12/255.0, green: 156/255.0, blue: 43/255.0, alpha: 1.0).cgColor
        } else {
            self.backgroundColor = UIColor.init(red: 155/255.0, green: 28/255.0, blue: 42/255.0, alpha: 1.0)
            self.layer.shadowColor = UIColor.init(red: 155/255.0, green: 28/255.0, blue: 42/255.0, alpha: 1.0).cgColor
        }
        battleLabel.text = "Battle 1"
    }
 
}
