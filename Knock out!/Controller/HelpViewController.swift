//
//  HelpViewController.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import Foundation
import UIKit

class HelpViewController: UIViewController {
    let helpView = HelpView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        layout()
        
    }
    func layout() {
        view.addSubview(helpView)
        NSLayoutConstraint.activate([
            helpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            helpView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            helpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            helpView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            
            
        ])
    }
    
}
