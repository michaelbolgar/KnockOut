//
//  MainViewController.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {

    //MARK: - UI Elements

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
        button.layer.cornerRadius = 20
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
        button.layer.cornerRadius = 30
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
        button.layer.cornerRadius = 30
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
        button.layer.cornerRadius = 30
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

    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    //MARK: - Methods

    private func setupUI() {

//        navigationController?.navigationBar.prefersLargeTitles = true

        let amongInset: CGFloat = 7
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let imageSize: CGFloat = (screenWidth - 30)
        let buttonWidth: CGFloat = (screenWidth - 100)
        let buttonHeight: CGFloat = (screenHeight / 12)

        [backgroundImage, gameLabel, nameLabel, explosionImageView, startButton, continuousButton, categoryButton, helpButton].forEach { view.addSubview($0) }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        explosionImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.width.equalTo(imageSize)
            make.height.equalTo(imageSize)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(explosionImageView.snp.top).inset(amongInset - 10)
        }
        
        gameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top).inset(amongInset - 10)
        }

        categoryButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(buttonWidth)
            make.bottom.equalTo(view.snp.bottom).inset(15)
            make.height.equalTo(buttonHeight)
        }

        startButton.snp.makeConstraints { make in
            make.top.equalTo(explosionImageView.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }

        continuousButton.snp.makeConstraints { make in
            make.top.equalTo(startButton.snp.bottom).offset(amongInset)
            make.bottom.equalTo(categoryButton.snp.top).offset(-amongInset)
            make.centerX.equalToSuperview()
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }

        helpButton.snp.makeConstraints { make in
            make.size.equalTo(40)
            make.trailing.equalTo(view.snp.trailing).inset(20)
            make.bottom.equalTo(gameLabel.snp.top).inset(-3)

        }
    }

    //MARK: - Button's targets

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
