//
//  CategoryCell.swift
//  Knock out!
//
//  Created by Михаил Болгар on 13.08.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomCell : UICollectionViewCell {
    
    //MARK: - Properties
    
    var completionHandler: ((Int) -> Void)?
    
    //MARK: - UI Elements
    
    private lazy var logoImage = UIImageView()
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Искусство и кино"
        label.textColor = .yellow
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 16)
        return label
    }()
    
    lazy var checkButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
        button.setBackgroundImage(UIImage(systemName: "checkmark.circle.fill"), for: .selected)
        button.tintColor = .white
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Inits
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        
        contentView.backgroundColor = .purple
        
        contentView.addSubview(checkButton)
        contentView.addSubview(logoImage)
        contentView.addSubview(title)
        
        checkButton.snp.makeConstraints { make in
            make.size.equalTo(34)
            make.top.equalTo(contentView.snp.top).inset(10)
            make.left.equalTo(contentView.snp.left).inset(8)
        }
        
        logoImage.snp.makeConstraints { make in
            make.size.equalTo(86)
            make.top.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
        }
        
        title.snp.makeConstraints { make in
            make.width.equalTo(144)
            make.height.equalTo(50)
            make.top.equalTo(logoImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func tapButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        completionHandler?(sender.tag)
        
    }
    
    public func configure(_ model: CategoryModel) {
        logoImage.image = model.image
        title.text = model.name
        checkButton.isSelected = model.isSelected ?? false
    }
}
