//
//  HeroesDetailViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 27/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

//MARK: Delegate protocol

protocol HeroesViewControllerDelegate: AnyObject {
    func didPowerChanged()
}

class HeroesDetailViewController: UIViewController {
    
//    MARK: Properties
    
    weak var delegate: HeroesViewControllerDelegate?
    var heroe: Heroe?
    var battles: [Battle] = []
    
//    MARK: Lifecycle methods
    
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
//        return battles sorted
        guard let battles = heroe.battles?.allObjects.sorted(by: { ($0 as AnyObject).id < ($1 as AnyObject).id } ) as? [Battle] else {return}
        self.battles = battles
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
    
    
    private func showData() {
        battlesCollectionView.reloadData()
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

// MARK: CollectionView Methods

extension HeroesDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0);
//    }
    func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 100, height: 50)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return battles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroesCollectionViewCell", for: indexPath) as? HeroesCollectionViewCell {
            let battle = battles[indexPath.row]
            if let heroe = heroe{
                cell.setBattle(battle: battle, heroe: heroe)
                return cell
            }
        }
        fatalError("Could not create the Battle cell")
 
        
    }

    
}

//MARK: Delegate methods

extension HeroesDetailViewController: HeroesPowerDelegate {
    func didPowerChanged(forHeroe heroe: Heroe) {
        self.heroe = heroe
        self.setupUI()
        delegate?.didPowerChanged()
    }
    
}
