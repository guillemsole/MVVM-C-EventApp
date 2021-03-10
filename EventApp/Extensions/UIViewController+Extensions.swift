//
//  UIViewController+Extensions.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import UIKit

extension UIViewController {
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
