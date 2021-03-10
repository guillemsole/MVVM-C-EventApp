//
//  EventListViewModel.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import Foundation

final class EventListViewModel {
    let title = "Events"
    var coordinator: EventListCoordinator?
    
    func tappedAddEvent() {
        coordinator?.startAddEvent()
    }
    
}
