//
//  HelpView.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import Foundation
import UIKit

class HelpView: UIView {

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
