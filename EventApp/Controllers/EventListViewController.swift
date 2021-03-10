//
//  EventListViewController.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit

class EventListViewController: UIViewController {

    // If the view model is nil and we try to access it the app will crash
    // because we know that this view controller needs this view model
    var viewModel: EventListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        let image = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc private func tappedAddEventButton() {
        viewModel.tappedAddEvent()
    }
}
