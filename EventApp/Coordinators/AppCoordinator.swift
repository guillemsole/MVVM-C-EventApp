//
//  AppCoordinator.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] {get}
    func start()
}
final class AppCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let navigationController = UINavigationController()
        
        let eventListCoordinator = EventListCoordinator(navigationController: navigationController)
        
        // If we don't store the eventListCoordinator in our childCoordinator array we keep a reference to it to avoid deallocation
        childCoordinators.append(eventListCoordinator)
        eventListCoordinator.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
