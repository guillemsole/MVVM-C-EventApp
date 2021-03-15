//
//  EventListCoordinator.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit
import CoreData

final class EventListCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var onUpdateEvent: () -> Void = {}
    
    private var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventListViewController: EventListViewController = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        onUpdateEvent = eventListViewModel.reload
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.parentCoordinator = self
        addEventCoordinator.start()
    }
    
    func onSelect(_ id: NSManagedObjectID) {
        let eventDetailCoordinator = EventDetailCoordinator(eventID: id, navigationController: navigationController)
        childCoordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.parentCoordinator = self
        eventDetailCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        // Remove coordinator from our childCoordinator array
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return coordinator === childCoordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
