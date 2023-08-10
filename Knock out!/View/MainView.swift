//
//  MainView.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import Foundation
import UIKit

class MainView: UIView {
    let bombImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bomb"))
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let button1: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 35
        button.setTitle("Старт игры", for: .normal)
        button.backgroundColor = .systemPurple
        button.tintColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let button2: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 35
        button.setTitle("Продолжить", for: .normal)
        button.backgroundColor = .systemPurple
        button.tintColor = .yellow
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let button3: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 35
        button.setTitle("Категории", for: .normal)
        button.backgroundColor = .systemPurple
        button.tintColor = .yellow
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
        addSubview(bombImageView)
        addSubview(button1)
        addSubview(button2)
        addSubview(button3)
        
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
            bombImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            bombImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bombImageView.heightAnchor.constraint(equalToConstant: 200),
            bombImageView.widthAnchor.constraint(equalToConstant: 200),
            
            button1.widthAnchor.constraint(equalToConstant: 250),
            button1.heightAnchor.constraint(equalToConstant: 50),
            button1.centerXAnchor.constraint(equalTo: centerXAnchor),
            button1.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            button2.widthAnchor.constraint(equalToConstant: 250),
            button2.heightAnchor.constraint(equalToConstant: 50),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 20),
            button2.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            button3.widthAnchor.constraint(equalToConstant: 250),
            button3.heightAnchor.constraint(equalToConstant: 50),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 20),
            button3.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

    }

    func setupButtonActions() {
        button1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        button2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        button3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
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
