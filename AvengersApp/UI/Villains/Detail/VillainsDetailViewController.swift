//
//  HeroesDetailViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 27/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

protocol VillainsViewControllerDelegate: AnyObject {
    func didPowerChanged()
}

class VillainsDetailViewController: UIViewController {
    
    weak var delegate: VillainsViewControllerDelegate?
    var villain: Villain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        delegate?.didPowerChanged()
    }
    
    convenience init(withVillain villain: Villain){
        self.init(nibName: "VillainsDetailViewController", bundle: nil)
        self.villain = villain
        self.title = villain.villainName
    }
    
    
//    MARK: IBOutlet

    @IBOutlet weak var detailVillainImage: UIImageView!
    @IBOutlet weak var detailVillainPower: UIImageView!
    @IBOutlet weak var superPowerLabel: UILabel!
    @IBOutlet weak var battlesCollectionView: UICollectionView!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var biographyContentLabel: UILabel!
    

//    MARK: IBActions
    
    @IBAction func editPowerButton(_ sender: Any) {
        guard let vi = villain else {return}
        let villainsPowerVC = VillainsPowerViewController.init(withVillain: vi)
        villainsPowerVC.delegate = self
        villainsPowerVC.modalPresentationStyle = .overCurrentContext
        self.present(villainsPowerVC, animated: true, completion: nil)
    }
    
//    MARK: ConfigureView
    
    func setupUI() {
        detailVillainImage.image = UIImage.init(named: villain?.villainImage ?? "")
        self.setPowerImage()
        biographyContentLabel.text = villain?.villainBio ?? ""
        detailVillainImage.layer.cornerRadius = 15
        
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
        
        detailVillainPower.image = UIImage.init(named: powerImage)
    }

}

extension VillainsDetailViewController: VillainsPowerDelegate {
    func didPowerChanged(forVillain villain: Villain) {
        self.villain = villain
        self.setupUI()
        delegate?.didPowerChanged()
    }
    
}
