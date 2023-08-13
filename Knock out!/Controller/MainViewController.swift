//
//  MainViewController.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var backgroundImage = UIImageView(image: UIImage(named: "background"))
    
    private lazy var explosionImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "explosion"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bomb"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var gameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Игра для компании"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 30)
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
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
    
    private lazy var helpButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 22
        button.setTitle("?", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(helpButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 40
        button.setTitle("Cтарт игры", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var categoryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 40
        button.setTitle("Категории", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(categoryButtonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var continuousButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 40
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.isEnabled = UserDef.shared.checkState()
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(continousButtonAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(backgroundImage)
        view.addSubview(gameLabel)
        view.addSubview(nameLabel)
        view.addSubview(explosionImageView)
        view.addSubview(startButton)
        view.addSubview(continuousButton)
        view.addSubview(categoryButton)
        view.addSubview(helpButton)
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        gameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).inset(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(gameLabel.snp.bottom).inset(1)
        }
        
        explosionImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(354)
            make.height.equalTo(388)
            make.top.equalTo(nameLabel.snp.bottom).inset(10)
        }
        
        startButton.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(78)
            make.top.equalTo(explosionImageView.snp.bottom).inset(25)
            make.centerX.equalToSuperview()
        }
        
        continuousButton.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(78)
            make.top.equalTo(startButton.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
        }
        
        categoryButton.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(78)
            make.top.equalTo(continuousButton.snp.bottom).inset(-10)
            make.centerX.equalToSuperview()
        }
        
        helpButton.snp.makeConstraints { make in
            make.size.equalTo(44)
            make.right.equalTo(-8)
            make.top.equalTo(continuousButton.snp.bottom).inset(16)
        }
        
    }
    
    @objc private func startButtonAction() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc private func continousButtonAction() {
        continuousButton.isEnabled = false
        guard let gameVC = UserDef.shared.loadUsedDef() else { return }
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc private func categoryButtonAction() {
        let categoryVC = CategoryViewController()
        navigationController?.pushViewController(categoryVC, animated: true)
    }
    
    @objc private func helpButtonAction() {
        let helpVC = HelpViewController()
        navigationController?.pushViewController(helpVC, animated: true)
    }
}
