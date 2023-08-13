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

        let gameVC = GameViewController()
        currentGameVC = gameVC
        
        navigationController = UINavigationController(rootViewController: CategoryViewController()) // вот тут надо менять корневой контроллер на gameVC или helpVC или kategoryVC, чтобы видеть свой экран. Не забудьте раскомментить соответствующий контроллер выше))

        
        window?.rootViewController = createMainViewController()
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

    func createMainViewController() -> UINavigationController {
        let mainVC = MainViewController()
        return UINavigationController(rootViewController: mainVC)
    }

    func createCategoryViewController() -> UINavigationController {
        let categoryVC = CategoryViewController()
        return UINavigationController(rootViewController: categoryVC)
    }
    
    //MARK: - UserDefaults
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        UserDef.shared.save()
    }
}
