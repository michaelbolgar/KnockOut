//
//  HelpViewController.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import UIKit

class HelpViewController: UIViewController, UIScrollViewDelegate {

    //MARK: - Properties

    let helpView = HelpView()

    //MARK: - UI Elements
    
    let backgroungImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Помощь"
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 28)
        label.textColor = .purple
        return label
    }()
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.circle.fill"), style: .done, target: self, action: #selector(tapBack))
        button.tintColor = .purple
        return button
    }()

    //MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
        setupNavigation()
    }

    //MARK: - Methods

    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = titleLabel
        navigationItem.leftBarButtonItem = backButton
    }
    
    func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(backgroungImageView)
        scrollView.addSubview(helpView)
        helpView.heightAnchor.constraint(equalToConstant: 1400).isActive = true

        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isScrollEnabled = true

        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            backgroungImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroungImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroungImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroungImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            helpView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            helpView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            helpView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            helpView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])

//        scrollView.contentSize = helpView.frame.size
    }
    
    @objc private func tapBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}
