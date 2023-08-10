//
//  CustomCell.swift
//  CategoryForBomb
//
//  Created by Zhaniya on 10.08.2023.
//
import UIKit


class CustomCell : UICollectionViewCell {
    
    let categoryImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(categoryImageView)
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        categoryImageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        categoryImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        categoryImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        categoryImageView.layer.cornerRadius = 20
        categoryImageView.layer.masksToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
