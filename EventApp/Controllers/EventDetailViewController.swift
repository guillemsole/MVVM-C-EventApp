//
//  EventDetailViewController.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 11/3/21.
//

import UIKit

class EventDetailViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var timeRemainingStackView: TimeRemainingStackView! {
        didSet {
            timeRemainingStackView.setup()
        }
    }
    var viewModel: EventDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.onUpdate = { [weak self] in
            guard let self = self, let timeRemainingViewModel = self.viewModel.timeRemainingViewModel else { return }
            self.backgroundImageView.image = self.viewModel.image
            self.timeRemainingStackView.update(with: timeRemainingViewModel)
        }
        viewModel.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }

}
