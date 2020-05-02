//
//  HeroesDetailViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 27/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

//MARK: Delegate protocol

protocol VillainsViewControllerDelegate: AnyObject {
    func didPowerChanged()
}

class VillainsDetailViewController: UIViewController {
    
//    MARK: Properties
    
    weak var delegate: VillainsViewControllerDelegate?
    var villain: Villain?
    var battles: [Battle] = []
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 233/255.0, green: 117/255.0, blue: 100/255.0, alpha: 1.0)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        self.navigationController?.navigationBar.barTintColor = UIColor.init(red: 131/255.0, green: 166/255.0, blue: 233/255.0, alpha: 1.0)
        delegate?.didPowerChanged()
    }
    
    convenience init(withVillain villain: Villain){
        self.init(nibName: "VillainsDetailViewController", bundle: nil)
        self.villain = villain
//        return battles sorted
        guard let battles = villain.battles?.allObjects.sorted(by: { ($0 as AnyObject).id < ($1 as AnyObject).id } ) as? [Battle] else {return}
        self.battles = battles
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
        self.showData()
        detailVillainImage.image = UIImage.init(named: villain?.villainImage ?? "")
        self.setPowerImage()
        biographyContentLabel.text = villain?.villainBio ?? ""
        detailVillainImage.layer.cornerRadius = 15
//        CollectionView
        let nib = UINib.init(nibName: "VillainsCollectionViewCell", bundle: nil)
        battlesCollectionView.register(nib, forCellWithReuseIdentifier: "VillainsCollectionViewCell")
            
        battlesCollectionView.delegate = self
        battlesCollectionView.dataSource = self
        
    }
    
    
    private func showData() {
        battlesCollectionView.reloadData()
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

// MARK: CollectionView Methods

extension VillainsDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
           layout collectionViewLayout: UICollectionViewLayout,
           sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 100, height: 50)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        battles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VillainsCollectionViewCell", for: indexPath) as? VillainsCollectionViewCell {
            let battle = battles[indexPath.row]
            if let villain = villain {
                cell.setBattle(battle: battle, villain: villain)
                return cell
            }
        }
        fatalError("Could not create the Battle cell")
 
        
    }

    
}

//MARK: Delegate methods

extension VillainsDetailViewController: VillainsPowerDelegate {
    func didPowerChanged(forVillain villain: Villain) {
        self.villain = villain
        self.setupUI()
        delegate?.didPowerChanged()
    }
    
}

