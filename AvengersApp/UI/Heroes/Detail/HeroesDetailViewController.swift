//
//  HeroesDetailViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 27/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

protocol HeroesViewControllerDelegate: AnyObject {
    func didPowerChanged()
}

class HeroesDetailViewController: UIViewController {
    
    weak var delegate: HeroesViewControllerDelegate?
    var heroe: Heroe?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.didPowerChanged()
    }
    
    convenience init(withHeroe heroe: Heroe ){
        self.init(nibName: "HeroesDetailViewController", bundle: nil)
        self.heroe = heroe
        self.title = heroe.heroeName
    }
    
    func setupUI() {
        detailHeroeImage.image = UIImage.init(named: heroe?.heroeImage ?? "")
        self.setPowerImage()
        biographyContentLabel.text = heroe?.heroeBio ?? ""
        detailHeroeImage.layer.cornerRadius = 15
        
    }
    
    
//    MARK: IBOutlet

    @IBOutlet weak var detailHeroeImage: UIImageView!
    @IBOutlet weak var detailHeroePower: UIImageView!
    @IBOutlet weak var superPowerLabel: UILabel!
    @IBOutlet weak var battlesCollectionView: UICollectionView!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var biographyContentLabel: UILabel!
    
    
    func setPowerImage () {
        let powerImage: String
        
        
        let power = heroe?.heroePower
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
        
        detailHeroePower.image = UIImage.init(named: powerImage)
    }

}
