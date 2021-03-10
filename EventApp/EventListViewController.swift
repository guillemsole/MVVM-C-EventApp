//
//  EventListViewController.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit

class EventListViewController: UIViewController {

    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
