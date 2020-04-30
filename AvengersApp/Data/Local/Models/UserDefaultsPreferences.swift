//
//  UserDefaultsPreferences.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 30/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import Foundation

class UserDefaultsPreferences {
    
    private let keyItsFirstTime = "ITS_FIRST_TIME"
    
    
    func setFirstTime() {
        UserDefaults.standard.set(true, forKey: keyItsFirstTime)
    }
    
    func isfirstTime() -> Bool {
        if UserDefaults.standard.bool(forKey: keyItsFirstTime) {return false} else {return true}
    }
    
}
