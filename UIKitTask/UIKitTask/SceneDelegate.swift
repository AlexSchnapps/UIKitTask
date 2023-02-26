//
//  SceneDelegate.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let firstVC = ViewController()
            let secondVC = secondViewController()
            
            //MARK: - Navigation
            let firstNavController = UINavigationController(rootViewController: firstVC)
            let secondNavController = UINavigationController(rootViewController: secondVC)
            let tabBarVC = UITabBarController()
            tabBarVC.setViewControllers([firstVC, secondVC], animated: true)
            window.rootViewController = tabBarVC
            window.backgroundColor = .white
            
            secondVC.loadViewIfNeeded()
            
            self.window = window
            window.makeKeyAndVisible()
        }
        }
        
        func sceneDidDisconnect(_ scene: UIScene) {
            
        }
        
        func sceneDidBecomeActive(_ scene: UIScene) {
            
        }
        
        func sceneWillResignActive(_ scene: UIScene) {
            
        }
        
        func sceneWillEnterForeground(_ scene: UIScene) {
            
        }
        
        func sceneDidEnterBackground(_ scene: UIScene) {
            
        }
        
        
    }
    
