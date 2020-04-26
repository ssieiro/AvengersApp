//
//  SceneDelegate.swift
//  AvengersApp
//
//  Created by Sonia Sieiro on 24/04/2020.
//  Copyright © 2020 Sonia Sieiro. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
 
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let heroesVC  = HeroesViewController.init(nibName:  "HeroesViewController", bundle: nil)
        let battlesVC = BattlesViewController.init(nibName: "BattlesViewController", bundle: nil)
        let villainsVC = VillainsViewController.init(nibName: "VillainsViewController", bundle: nil)
        
        let navHeroesVC = UINavigationController.init(rootViewController: heroesVC)
        let navBattlesVC = UINavigationController.init(rootViewController: battlesVC)
        let navVillainsVC = UINavigationController.init(rootViewController: villainsVC)
        
        navHeroesVC.navigationBar.barTintColor = UIColor.init(red: 131/255.0, green: 166/255.0, blue: 233/255.0, alpha: 1.0)
        navHeroesVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 26.0), .foregroundColor: UIColor.white]
        
        navBattlesVC.navigationBar.barTintColor = UIColor.init(red: 131/255.0, green: 166/255.0, blue: 233/255.0, alpha: 1.0)
        navBattlesVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 26.0), .foregroundColor: UIColor.white]
        navVillainsVC.navigationBar.barTintColor = UIColor.init(red: 131/255.0, green: 166/255.0, blue: 233/255.0, alpha: 1.0)
        navVillainsVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 26.0), .foregroundColor: UIColor.white]

        
        heroesVC.tabBarItem  = UITabBarItem.init(title: "Heroes", image: UIImage.init(named: "ic_tab_heroes"), tag: 0)
        battlesVC.tabBarItem   = UITabBarItem.init(title: "Battles", image: UIImage.init(named: "ic_tab_battles"), tag: 1)
        villainsVC.tabBarItem   = UITabBarItem.init(title: "Villains",image: UIImage.init(named: "ic_tab_villain"), tag: 2)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers  = [navHeroesVC,navBattlesVC,navVillainsVC]
        

        tabBarController.tabBar.barStyle  = .default
        tabBarController.tabBar.isTranslucent  = true
        tabBarController.tabBar.tintColor = UIColor.init(red: 6/255.0, green: 98/255.0, blue: 220/255.0, alpha: 1.0)

        
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

