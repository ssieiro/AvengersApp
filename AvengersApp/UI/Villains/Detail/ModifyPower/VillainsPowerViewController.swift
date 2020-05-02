//
//  HeroesPowerViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 27/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

//MARK: Delegate protocol

protocol VillainsPowerDelegate: AnyObject {
    func didPowerChanged(forVillain villain: Villain)
}

class VillainsPowerViewController: UIViewController {
    
//    MARK: Properties
    
    weak var delegate: VillainsPowerDelegate?
    var villain: Villain?
    
//    MARK: Lifecycle methods
    
    override func viewDidLoad () {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        guard let villain = self.villain else {return}
        delegate?.didPowerChanged(forVillain: villain)
    }
    
    convenience init(withVillain villain: Villain){
        self.init(nibName: "VillainsPowerViewController", bundle: nil)
        self.villain = villain
    }
    
//    MARK: IBOutlet
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var powerLabel: UILabel!
    @IBOutlet weak var powerSlider: UISlider!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var powerNumberLabel: UILabel!
    
//    MARK: IBActions

    @IBAction func cancelSetPower(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func confirmSetPower(_ sender: Any) {
        let dataProvider = DataProvider()
        guard let villain = self.villain else {return}
        villain.villainPower = Int16(powerSlider.value)
        dataProvider.saveChanges()
        delegate?.didPowerChanged(forVillain: villain)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setPower(_ sender: UISlider) {
        let rate = Int(sender.value)
        powerNumberLabel.text = "\(rate)"
    }
    
//    MARK: ConfigureView
    
    func setupUI() {
        myView.layer.cornerRadius = 8.0
        cancelButton.layer.cornerRadius = 8.0
        confirmButton.layer.cornerRadius = 8.0
        guard let power = villain?.villainPower else {return}
        powerSlider.value = Float(Int(power))
        powerNumberLabel.text = String(power)
        setupViewEffects()
    }
    
    func setupViewEffects () {
        let blurEffect = UIBlurEffect(style: .extraLight)
        let blurredEffectView = UIVisualEffectView(effect: blurEffect)
        blurredEffectView.frame = view.bounds
        view.addSubview(blurredEffectView)
        view.sendSubviewToBack(blurredEffectView)
    }
    
}
