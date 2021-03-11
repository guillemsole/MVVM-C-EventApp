//
//  EventDetailCoordinator.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 11/3/21.
//

import UIKit
import CoreData

final class EventDetailCoordinator: Coordinator {
    private let navigationController: UINavigationController?
    private let eventID: NSManagedObjectID
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: EventListCoordinator?
    
    init(eventID: NSManagedObjectID, navigationController: UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    
    func start() {
        let eventDetailViewController: EventDetailViewController = .instantiate()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        eventDetailViewController.viewModel = eventDetailViewModel
        navigationController?.pushViewController(eventDetailViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
