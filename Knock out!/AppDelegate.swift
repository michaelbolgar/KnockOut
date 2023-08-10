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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        self.window = UIWindow (frame: UIScreen.main.bounds)

//        let viewController = ViewController()
//        let mainVC = MainViewController()
        let gameVC = GameViewController()
//        let helpVC = HelpViewController()
//        let kategoryVC = KategoryViewController()

        navigationController = UINavigationController(rootViewController: CategoryViewController()) // вот тут надо менять корневой контроллер на gameVC или helpVC или kategoryVC, чтобы видеть свой экран. Не забудьте раскомментить соответствующий контроллер выше))

        window?.rootViewController = navigationController

        self.window?.makeKeyAndVisible()

        return true
    }
}
