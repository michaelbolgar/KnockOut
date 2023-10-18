import Foundation
import UIKit
import SnapKit

class CustomCell : UICollectionViewCell {
    
    //MARK: - Properties
    
    var completionHandler: ((Int) -> Void)?
    static let screenWidth = UIScreen.main.bounds.width
    static let sideInset: CGFloat = 16
    static let amongInset: CGFloat = 10
    static let cellSize: CGFloat = ((screenWidth - (sideInset * 2) - amongInset) / 2 - 15)
    
    //MARK: - UI Elements
    
    private lazy var logoImage = UIImageView()

//    private lazy var logoImage: UIImageView = {
//        let image = UIImageView()
//        image.backgroundColor = .white
//        return image
//    }()

    private lazy var categoryLabel = UILabel.makeLabel(font: UIFont(name: "DelaGothicOne-Regular", size: 16),
                                                       textColor: .black,
                                                       numberOfLines: 1)
    
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
//        self.backgroundColor = .white
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        
        contentView.backgroundColor = UIColor.buttonYellow
        contentView.addSubview(logoImage)
        contentView.addSubview(categoryLabel)
        contentView.addSubview(checkButton)

        //регуляция размера ячейки
        contentView.snp.makeConstraints { make in
            make.size.equalTo(CustomCell.cellSize)
        }

        checkButton.snp.makeConstraints { make in
            make.size.equalTo(34)
            make.top.equalTo(contentView.snp.top).inset(10)
            make.left.equalTo(contentView.snp.left).inset(10)
        }
        
        logoImage.snp.makeConstraints { make in
            make.size.equalTo(CustomCell.cellSize * 0.60)
            make.top.equalToSuperview().inset(18)
            make.centerX.equalToSuperview()
        }
        
        categoryLabel.snp.makeConstraints { make in
            make.width.equalTo(144)
            make.height.equalTo(50)
            make.top.equalTo(logoImage.snp.bottom).inset(12)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func tapButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        completionHandler?(sender.tag)
        
    }
    
    public func configure(_ model: CategoryModel) {
        logoImage.image = model.image
        categoryLabel.text = model.name
        checkButton.isSelected = model.isSelected ?? false
    }
}
