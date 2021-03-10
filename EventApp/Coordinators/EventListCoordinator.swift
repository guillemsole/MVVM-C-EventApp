//
//  EventListCoordinator.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventListViewController: EventListViewController = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.parentCoordinator = self
        addEventCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        // Remove coordinator from our childCoordinator array
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return type(of: coordinator) == type(of: childCoordinator)
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
