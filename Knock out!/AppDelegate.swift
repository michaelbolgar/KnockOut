//
//  AppDelegate.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navigationController: UINavigationController?
    var currentGameVC: GameViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        self.window = UIWindow (frame: UIScreen.main.bounds)
        
        //        let viewController = ViewController()
//        let mainVC = MainViewController()
        let gameVC = GameViewController()
        currentGameVC = gameVC
        let helpVC = HelpViewController()
        //        let kategoryVC = KategoryViewController()
        
        navigationController = UINavigationController(rootViewController: helpVC)
        
        window?.rootViewController = createHelpViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func createHelpViewController() -> UINavigationController {
        let helpVC = HelpViewController()
        helpVC.title = "Помощь"

        let titleFont = UIFont(name: "DelaGothicOne-Regular", size: 10)
        let titleColor = UIColor.systemPurple

        let titleTextAttributes: [NSAttributedString.Key: Any] = [
            .font: titleFont as Any,
            .foregroundColor: titleColor
            ]

        helpVC.navigationController?.navigationBar.titleTextAttributes = titleTextAttributes
        return UINavigationController(rootViewController: helpVC)
    }
    
    //MARK: - UserDefaults
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        UserDef.shared.save()
    }
}
