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
        button.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
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
        button.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var continuousButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 40
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = gameLabel
        
        view.addSubview(backgroundImage)
        view.addSubview(nameLabel)
        view.addSubview(explosionImageView)
        view.addSubview(startButton)
        view.addSubview(continuousButton)
        view.addSubview(categoryButton)
        view.addSubview(helpButton)
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.snp.top).inset(80)
        }
        
        explosionImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(374)
            make.height.equalTo(408)
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
            make.top.equalTo(startButton.snp.bottom).inset(-20)
            make.centerX.equalToSuperview()
        }
        
        categoryButton.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(78)
            make.top.equalTo(continuousButton.snp.bottom).inset(-20)
            make.centerX.equalToSuperview()
        }
        
        helpButton.snp.makeConstraints { make in
            make.size.equalTo(44)
            make.right.equalTo(-20)
            make.top.equalTo(categoryButton.snp.bottom).inset(20)
        }
        
    }
    
    @objc private func button1Tapped() {
        let gameVC = GameViewController()
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc private func button2Tapped() {
        
        guard let gameVC = UserDef.shared.loadUsedDef() else { return }
        continuousButton.isEnabled = true
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    @objc private func button3Tapped() {
        print("нажата третья кнопка")
    }
}
