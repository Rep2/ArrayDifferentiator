import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow? = UIWindow()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window?.rootViewController = UINavigationController(rootViewController: ChangeTableViewController(style: .grouped))
        window?.makeKeyAndVisible()

        return true
    }
}
