//
//  HeroesTableViewCell.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 26/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit


class VillainsTableViewCell: UITableViewCell {
    
    private var villain: Villain?
    
    @IBOutlet weak var villainImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starImage: UIImageView!
    
    
    override func awakeFromNib() {
        villainImage.layer.cornerRadius = 15
        villainImage.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        villainImage.layer.borderWidth = 1.0
    }
    
    override func prepareForReuse() {
        villain = nil
       }
    
    func setVillain (_ villain: Villain) {
        self.villain = villain
        villainImage.image = UIImage.init(named: villain.villainImage ?? "")
        nameLabel.text = villain.villainName ?? ""
        self.setPowerImage()
    }
    
    func setPowerImage () {
       let powerImage: String
        
        let power = villain?.villainPower
        switch power {
        case 0:
            powerImage = "ic_stars_0"
        case 1:
            powerImage = "ic_stars_1"
        case 2:
        powerImage = "ic_stars_2"
        case 3:
        powerImage = "ic_stars_3"
        case 4:
        powerImage = "ic_stars_4"
        case 5:
        powerImage = "ic_stars_5"
            
        default:
            powerImage = "ic_stars_0"
        }
        
        starImage.image = UIImage.init(named: powerImage)
    }
}
