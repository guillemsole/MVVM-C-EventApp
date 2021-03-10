//
//  SceneDelegate.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    // Entry point
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        self.window = window
        
        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()
    }
}

