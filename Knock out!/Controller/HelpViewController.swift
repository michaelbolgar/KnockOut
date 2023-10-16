import UIKit
import SnapKit

class HelpViewController: UIViewController, UIScrollViewDelegate {

    //MARK: - Properties

    let helpView = HelpView()

    //MARK: - UI Elements

    private lazy var backgroundImage = UIImageView(image: UIImage(named: "background5"))
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var titleLabel = UILabel.makeLabel(text: "Помощь",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 28),
                                                   textColor: .black,
                                                   numberOfLines: 1)
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.circle.fill"), style: .done, target: self, action: #selector(tapBack))
        button.tintColor = UIColor.buttonRed
        return button
    }()

    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "bomb2"))
        imageView.contentMode = .scaleToFill
        imageView.alpha = 0.2
        return imageView
    }()

    //MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        setupNavigation()
    }

    //MARK: - Methods

    private func setupNavigation() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = titleLabel
        navigationItem.leftBarButtonItem = backButton
    }
    
    func layout() {
        view.addSubview(backgroundImage)
        view.addSubview(scrollView)
        scrollView.addSubview(bombImageView)
        scrollView.addSubview(helpView)
        helpView.heightAnchor.constraint(equalToConstant: 1400).isActive = true //это можно перенести в массив ниже

        scrollView.delegate = self
        scrollView.showsHorizontalScrollIndicator = false //это вроде как можно убрать
        scrollView.isScrollEnabled = true //это тоже

        //привести в единый вид - через снэпкит
        let screenHeight = UIScreen.main.bounds.height
        let bombSize: CGFloat = (screenHeight * 0.42 + 20)

        backgroundImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        bombImageView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.trailing.equalTo(view.snp.trailing).offset(85)
            make.height.equalTo(bombSize - 25)
            make.width.equalTo(bombSize - 75)
        }


        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            helpView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            helpView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            helpView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            helpView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])

//        scrollView.contentSize = helpView.frame.size
    }
    
    @objc private func tapBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}
