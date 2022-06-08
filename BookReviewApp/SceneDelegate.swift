//
//  SceneDelegate.swift
//  BookReviewApp
//
//  Created by 田澤歩 on 2022/01/08.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        //guard let _ = (scene as? UIWindowScene) else { return }
        ///*
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = BookReviewListViewController()
            //window.rootViewController = NavigationController.init()
            self.window = window
            window.makeKeyAndVisible()
            
            /*
            let token = self.loadToken()
            if ((token) != nil) {
                print(token)
                let window = UIWindow(windowScene: windowScene)
                window.rootViewController = BookReviewListViewController.init()
                self.window = window
                window.makeKeyAndVisible()
                
            } else {
            let window = UIWindow(windowScene: windowScene)
//            window.rootViewController = EditBookReviewViewController()
            //window.rootViewController = DetailBookReviewViewController()
            //window.rootViewController = PostBookReviewViewController()
            //window.rootViewController = BookReviewListViewController.init()
            window.rootViewController = NavigationController.init()
            //window.rootViewController = LoginViewController.init()
            self.window = window
            window.makeKeyAndVisible()
            }
            */
        }
         //*/
    }
    
    func loadToken() -> String? {
         let id = "id"
         let key = "userToken"
         
         let query: [String: Any] = [
             kSecClass              as String: kSecClassGenericPassword,
             kSecAttrService        as String: key,
             kSecAttrAccount        as String: id,
             kSecMatchLimit         as String: kSecMatchLimitOne,
             kSecReturnAttributes   as String: true,
             kSecReturnData         as String: true,
         ]
             
         var item: CFTypeRef?
         let status = SecItemCopyMatching(query as CFDictionary, &item)
         switch status {
         case errSecItemNotFound:
             return nil
         case errSecSuccess:
             guard let item = item,
                   let value = item[kSecValueData as String] as? Data else {
                       print("トークンデータなし")
                       return nil
                   }
             guard let loadString = String(data: value, encoding: .utf8) else {
                 return nil
             }
             return loadString
         default:
             print("該当なし")
         }
         return nil
     }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
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

