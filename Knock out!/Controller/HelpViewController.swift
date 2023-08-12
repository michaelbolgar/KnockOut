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

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }

    func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(helpView)
        helpView.heightAnchor.constraint(equalToConstant: 1500).isActive = true
        scrollView.isScrollEnabled = true
        scrollView.showsHorizontalScrollIndicator = false

        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            helpView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            helpView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            helpView.widthAnchor.constraint(equalTo: view.widthAnchor),
            helpView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}
