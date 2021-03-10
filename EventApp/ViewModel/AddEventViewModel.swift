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
    }

    private(set) var cells: [Cell] = []
    var coordinator: AddEventCoordinator?
    
    func viewDidLoad() {
        cells = [
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Name", subtitle: "", placeholder: "Add a name", type: .text, onCellUpdate: {})
            ),
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Date", subtitle: "", placeholder: "Select a date", type: .date, onCellUpdate: { [weak self] in
                    self?.onUpdate()
                })
            ),
            .titleSubtitle(
                TitleSubtitleCellViewModel(title: "Background", subtitle: "", placeholder: "Select a date", type: .image, onCellUpdate: { [weak self] in
                    self?.onUpdate()
                })
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
        }
    }
    
    deinit {
        print("deinit from add event view model")
    }
}

