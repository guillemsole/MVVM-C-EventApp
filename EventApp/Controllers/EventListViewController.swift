//
//  EventListViewController.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit

class EventListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // If the view model is nil and we try to access it the app will crash
    // because we know that this view controller needs this view model
    var viewModel: EventListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()

        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }

        viewModel.viewDidLoad()
    }
    
    private func setupViews() {
        let image = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(tappedAddEventButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = viewModel.title
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(EventCell.self, forCellReuseIdentifier: "EventCell") //
    }
    
    @objc private func tappedAddEventButton() {
        viewModel.tappedAddEvent()
    }
}

extension EventListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel.cell(at: indexPath) {
        case .event(let eventCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell
            cell.update(with: eventCellViewModel)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
}

extension EventListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
    }
}
