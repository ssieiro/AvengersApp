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
    var battles: [Battle] = []
    
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
    
    

    
//    MARK: IBOutlet

    @IBOutlet weak var detailHeroeImage: UIImageView!
    @IBOutlet weak var detailHeroePower: UIImageView!
    @IBOutlet weak var superPowerLabel: UILabel!
    @IBOutlet weak var battlesCollectionView: UICollectionView!
    @IBOutlet weak var biographyLabel: UILabel!
    @IBOutlet weak var biographyContentLabel: UILabel!
    
//    MARK: IBActions
    
    @IBAction func editPowerButton(_ sender: Any) {
        guard let he = heroe else {return}
        let heroesPowerVC = HeroesPowerViewController.init(withHeroe: he)
        heroesPowerVC.delegate = self
        heroesPowerVC.modalPresentationStyle = .overCurrentContext
        self.present(heroesPowerVC, animated: true, completion: nil)
    }
    
//    MARK: ConfigureView
    
    func setupUI() {
        self.loadData()
        self.showData()
        detailHeroeImage.image = UIImage.init(named: heroe?.heroeImage ?? "")
        self.setPowerImage()
        biographyContentLabel.text = heroe?.heroeBio ?? ""
        detailHeroeImage.layer.cornerRadius = 15
        
//        CollectionView
        let nib = UINib.init(nibName: "HeroesCollectionViewCell", bundle: nil)
        battlesCollectionView.register(nib, forCellWithReuseIdentifier: "HeroesCollectionViewCell")
            
        battlesCollectionView.delegate = self
        battlesCollectionView.dataSource = self
    }
    
    
    private func loadData () {
        let dataProvider = DataProvider()
        self.battles = dataProvider.loadAllBattles()
        print ("\(String(describing: battles[0].fighter1))")
        print ("\(String(describing: battles[1].fighter1))")
        print ("\(String(describing: battles[2].fighter1))")
    }
    
    private func showData() {
        battlesCollectionView.reloadData()
    }
    
    private func updateAllData() {
        self.loadData()
        self.showData()
    }
    
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

extension HeroesDetailViewController: HeroesPowerDelegate {
    func didPowerChanged(forHeroe heroe: Heroe) {
        self.heroe = heroe
        self.setupUI()
        delegate?.didPowerChanged()
    }
    
}

extension HeroesDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 158, height: 50)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        battles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroesCollectionViewCell", for: indexPath) as? HeroesCollectionViewCell {
            let battle = battles[indexPath.row]
            if let heroe = heroe {
                cell.setBattle(battle: battle, heroe: heroe)
                return cell
            }
        }
        fatalError("Could not create the Battle cell")
 
        
    }

    
}
