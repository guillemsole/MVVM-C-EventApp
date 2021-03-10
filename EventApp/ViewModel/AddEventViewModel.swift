//
//  AddEventViewModel.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit

final class AddEventViewModel {
    let title = "Add"
    
    var onUpdate: () -> Void = {}

    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
        case titleImage
    }

    private(set) var cells: [Cell] = []
    var coordinator: AddEventCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name")
            ),
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date")
            )
        ]
        onUpdate()
    }

    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(for indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
    
    func tappedDone() {
        print("tappedDone")
        // extract info from cell view models and save in core data
        // tell coordinator to dismiss
    }
    
    func updateCell(indexPath: IndexPath, subtitle: String) {
        switch cells[indexPath.row] {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            titleSubtitleCellViewModel.update(subtitle)
        case .titleImage:
            break
        }
    }
    
    deinit {
        print("deinit from add event view model")
    }
}

