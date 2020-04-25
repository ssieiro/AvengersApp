//
//  ViewController.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 24/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

class HeroesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Heroes"
//        self.navigationController?.isNavigationBarHidden = true
    }

    @IBOutlet weak var heroes: UILabel!
    
}

