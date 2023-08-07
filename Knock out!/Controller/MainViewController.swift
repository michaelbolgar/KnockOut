//
//  MainViewController.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import UIKit

class MainViewController: UIViewController {

    let mainView = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        layout()
    }

    func layout() {

        view.addSubview(mainView)

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
