//
//  DefaultHelpLabel.swift
//  Knock out!
//
//  Created by MacBook Pro on 11.08.23.
//

import Foundation
import UIKit

final class DefaultHelpLabel: UILabel {
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        textColor = .black
        numberOfLines = 0
        font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
}
