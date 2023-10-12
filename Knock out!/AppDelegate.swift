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
        
        window?.rootViewController = createMainViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    func createHelpViewController() -> UINavigationController {
        let helpVC = HelpViewController()
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
