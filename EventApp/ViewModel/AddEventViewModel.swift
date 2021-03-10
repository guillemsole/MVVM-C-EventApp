//
//  AddEventViewModel.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import Foundation

final class AddEventViewModel {
    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("deinit from add event view model")
    }
}
