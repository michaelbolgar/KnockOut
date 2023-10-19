import UIKit
import SnapKit

class SecondBackground: UIView {

    //MARK: - UI Elements

    private lazy var backgroundImage = UIImageView(image: UIImage(named: "background5"))

    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bomb2"))
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.2
        return imageView
    }()

    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layout() {
        self.addSubview(backgroundImage)
        self.addSubview(bombImageView)

        let screenHeight = UIScreen.main.bounds.height
        let bombSize: CGFloat = (screenHeight * 0.42 + 20)

        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        bombImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.trailing.equalTo(self.snp.trailing).offset(85)
            make.height.equalTo(bombSize - 25)
            make.width.equalTo(bombSize - 75)
        }
    }
}
