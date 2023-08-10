//
//  MainView.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import Foundation
import UIKit

class MainView: UIView {

    let explosionImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "explosion"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let bombImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bomb"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let gameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Игра для компании"
        label.textAlignment = .center
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 34)
        return label
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "БОМБА"
        label.textAlignment = .center
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 50)
        label.textColor = .systemPurple
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize (width: 4.0, height: 4.0)
        label.layer.shadowOpacity = 0.6
        label.layer.shadowRadius = 0.4
        return label
    }()

    let startButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 40
        button.setTitle("Старт игры", for: .normal)
        button.backgroundColor = .systemPurple
//        button.tintColor = .yellow
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 28)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let categoryButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 40
        button.setTitle("Категории", for: .normal)
        button.backgroundColor = .systemPurple
//        button.tintColor = .yellow
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 28)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let helpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.setTitle("?", for: .normal)
        button.backgroundColor = .systemPurple
        button.tintColor = .yellow
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemRed
        
        setupUI()
        setupButtonActions()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupUI() {

        addSubview(nameLabel)
        addSubview(gameLabel)
        addSubview(explosionImageView)
        addSubview(bombImageView)
        addSubview(startButton)
        addSubview(categoryButton)
        addSubview(helpButton)
        
        let backgroundImage = UIImage(named: "background")
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(backgroundImageView)
        sendSubviewToBack(backgroundImageView)
        
        NSLayoutConstraint.activate([

            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),

            gameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            gameLabel.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),

            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: gameLabel.bottomAnchor, constant: 30),

            explosionImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            explosionImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            explosionImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -30),
            explosionImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 30),

            bombImageView.centerXAnchor.constraint(equalTo: explosionImageView.centerXAnchor),
            bombImageView.centerYAnchor.constraint(equalTo: explosionImageView.centerYAnchor),
            bombImageView.heightAnchor.constraint(equalToConstant: 265),
            bombImageView.widthAnchor.constraint(equalToConstant: 265),

            startButton.widthAnchor.constraint(equalToConstant: 274),
            startButton.heightAnchor.constraint(equalToConstant: 78),
            startButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            startButton.topAnchor.constraint(equalTo: bombImageView.bottomAnchor, constant: 80),

            categoryButton.widthAnchor.constraint(equalToConstant: 274),
            categoryButton.heightAnchor.constraint(equalToConstant: 78),
            categoryButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 20),
            categoryButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            helpButton.widthAnchor.constraint(equalToConstant: 50),
            helpButton.heightAnchor.constraint(equalToConstant: 50),
            helpButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            helpButton.bottomAnchor.constraint(equalTo: categoryButton.bottomAnchor)
        ])

    }

    func setupButtonActions() {
        startButton.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        helpButton.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
    }

    @objc func button1Tapped() {
        print("нажата первая кнопка")
    }

    @objc func button2Tapped() {
        print("нажата вторая кнопка")
    }

    @objc func button3Tapped() {
        print("нажата третья кнопка")
    }
}
