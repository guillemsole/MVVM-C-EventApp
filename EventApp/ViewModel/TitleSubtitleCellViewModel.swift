//
//  TitleSubtitleCellViewModel.swift
//  EventApp
//
//  Created by Guillem Solé Cubilo on 10/3/21.
//

import Foundation

final class TitleSubtitleCellViewModel {
    let title: String
    private(set) var subtitle: String
    let placeholder: String
    
    init(title: String, subtitle: String, placeholder: String) {
        self.title = title
        self.subtitle = subtitle
        self.placeholder = placeholder
    }
    
    func update(_ subtitle: String) {
        self.subtitle = subtitle
    }
}
