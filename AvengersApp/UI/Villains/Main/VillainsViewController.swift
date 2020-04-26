//
//  VillainsViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 24/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//


import UIKit

class VillainsViewController: UIViewController {

        private let dataProvider = DataProvider()
        private var villains: [Villain] = []
        
        @IBOutlet weak var villainsTableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.setupUI()
            self.updateAllData()
            
    }
        
    //  MARK: SetupUI
        
        func setupUI() {
            self.title = "Villains"
            let nib = UINib.init(nibName: "VillainsTableViewCell", bundle: nil)
            villainsTableView.register(nib, forCellReuseIdentifier: "VillainsTableViewCell")
            self.villainsTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
            villainsTableView.delegate = self
            villainsTableView.dataSource = self
            
        }
        
    
        
        private func loadData () {
            let dataProvider = DataProvider()
            self.villains = dataProvider.loadAllVillains()
        }
        
        private func showData() {
            villainsTableView.reloadData()
        }
        
        private func updateAllData() {
            self.loadData()
            self.showData()
        }

        
    }

    extension VillainsViewController: UITableViewDelegate, UITableViewDataSource {
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 236
        }
        
        func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
            true
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // cuando seleccionemos la tabla para ir al detalle
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return villains.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "VillainsTableViewCell", for: indexPath) as? VillainsTableViewCell {
                let vi = villains [indexPath.row]
                cell.setVillain(vi)
                cell.delegate = self
                return cell
            }
    fatalError("Could not create the Episode cell")
        }
        
        
    }

    extension VillainsViewController: VillainCellDelegate {
        func didPowerChanged(_ villain: Villain?) {
            updateAllData()
        }
        
        
    }