//
//  GameEndViewController.swift
//  Knock out!
//
//  Created by sidzhe on 08.08.2023.
//

import UIKit
import SnapKit

class GameEndViewController: UIViewController {

    //MARK: - UI Elements
    
    private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        return image
    }()
    
    private var boomImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image")
        return image
    }()
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Нажмите “Запустить” чтобы начать игру"
        label.numberOfLines = 3
        label.textAlignment = .center
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 28)
        label.textColor = .purple
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .purple
        button.layer.cornerRadius = 40
        button.setTitle("Запустить", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(tapStart), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        
//        navigationController?.navigationBar.prefersLargeTitles = true
                
        view.addSubview(image)
        view.addSubview(button)
        view.addSubview(headerLabel)
        view.addSubview(boomImage)
        
        image.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints { make in
            make.width.equalTo(274)
            make.height.equalTo(78)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(64)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(130)
        }
        
        boomImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(312)
            make.height.equalTo(352)
        }
    }
    
    @objc private func tapStart() {
        
    }
}
