import UIKit
import SnapKit

class MainViewController: UIViewController {

    //MARK: - UI Elements

    private lazy var backgroundImage = UIImageView(image: UIImage(named: "backgroundRed"))
    
    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bomb2"))
        imageView.contentMode = .scaleToFill
//        imageView.backgroundColor = .white
        return imageView
    }()

    private lazy var explosionImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "explosion2"))
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    private lazy var gameLabel = UILabel.makeLabel(text: "Игра для компании",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 30),
                                                   textColor: .black,
                                                   numberOfLines: 1)

    private lazy var nameLabel = UILabel.makeLabel(text: "БОМБА",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 50),
                                                   textColor: .black,
                                                   numberOfLines: 1)
    
    private lazy var helpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.setImage(UIImage(named: "questionButton"), for: .normal)
        button.addTarget(self, action: #selector(helpButtonAction), for: .touchUpInside)
        return button
    }()

    private lazy var startButton = UIButton.makeButton(text: "Старт",
                                                       color: UIColor.buttonYellow,
                                                        font: UIFont(name: "DelaGothicOne-Regular", size: 22),
                                                       textColor: UIColor.black,
                                                       radius: 30,
                                                       borderWidth: 2,
                                                       borderColor: UIColor.black)

    private lazy var categoryButton = UIButton.makeButton(text: "Категории",
                                                       color: UIColor.buttonYellow,
                                                        font: UIFont(name: "DelaGothicOne-Regular", size: 22),
                                                       textColor: UIColor.black,
                                                       radius: 30,
                                                       borderWidth: 2,
                                                       borderColor: UIColor.black)

    private lazy var continuousButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.buttonYellow
        button.layer.cornerRadius = 30
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont(name: "DelaGothicOne-Regular", size: 22)
        button.setTitleColor(.yellow, for: .normal)
        button.setTitleColor(.gray, for: .disabled)
        button.isEnabled = UserDef.shared.checkState()
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(continousButtonAction), for: .touchUpInside)
        return button
    }()

    //MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        setupSelectors()
    }

    //MARK: - Methods

    private func setupSelectors() {
        helpButton.addTarget(self, action: #selector(helpButtonAction), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        categoryButton.addTarget(self, action: #selector(categoryButtonAction), for: .touchUpInside)
    }

    private func setupUI() {

        let amongInset: CGFloat = 7
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let buttonWidth: CGFloat = (screenWidth - 100)
        let buttonHeight: CGFloat = (screenHeight * 0.07)
        let bombSize: CGFloat = (screenHeight * 0.42 + 20)

        print (screenWidth, screenHeight)
        //844*390 for i14
        //667*375.0 for SE

        [backgroundImage, explosionImageView, bombImageView, gameLabel, nameLabel, startButton, continuousButton, categoryButton, helpButton].forEach { view.addSubview($0) }
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        explosionImageView.snp.makeConstraints{ make in
            make.leading.equalTo(view.snp.leading).inset(-100)
            make.bottom.equalTo(view.snp.bottom).inset(-13)
            make.height.equalTo(screenHeight * 0.66)
            make.width.equalTo(screenWidth * 1.15)
        }

        bombImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(screenHeight * 0.13)
            make.trailing.equalTo(view.snp.trailing).offset(50)
            make.height.equalTo(bombSize)
            make.width.equalTo(bombSize - 50)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(bombImageView.snp.top).inset(5)
        }

        gameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(nameLabel.snp.top)
        }

        categoryButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(buttonWidth)
            make.bottom.equalTo(view.snp.bottom).inset(15)
            make.height.equalTo(buttonHeight)
        }

        continuousButton.snp.makeConstraints { make in
            make.top.equalTo(startButton.snp.bottom).offset(amongInset)
            make.bottom.equalTo(categoryButton.snp.top).offset(-amongInset)
            make.centerX.equalToSuperview()
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }

        startButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(buttonWidth)
            make.height.equalTo(buttonHeight)
        }

        helpButton.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.trailing.equalTo(view.snp.trailing).inset(10)
            make.bottom.equalTo(startButton.snp.top).offset(-5)

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
        print ("help button touched")
    }
}
