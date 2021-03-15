//
//  EventDetailCoordinator.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 11/3/21.
//

import UIKit
import CoreData

final class EventDetailCoordinator: Coordinator {
    private let navigationController: UINavigationController
    private let eventID: NSManagedObjectID
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: EventListCoordinator?
    var onUpdateEvent = {}
    init(eventID: NSManagedObjectID, navigationController: UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    
    func start() {
        let eventDetailViewController: EventDetailViewController = .instantiate()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        onUpdateEvent = {
            eventDetailViewModel.reload()
            self.parentCoordinator?.onUpdateEvent()
        }
        eventDetailViewController.viewModel = eventDetailViewModel
        navigationController.pushViewController(eventDetailViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    
    func onEditEvent(_ event: Event) {
        let editEventCoordinator = EditEventCoordinator(event: event, navigationController: navigationController)
        childCoordinators.append(editEventCoordinator)
        editEventCoordinator.parentCoordinator = self
        editEventCoordinator.start()
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
