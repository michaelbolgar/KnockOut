//
//  HelpView.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import Foundation
import UIKit
import SnapKit

class HelpView: UIView {

    //MARK: - Properties

    private var numberViews: [UIImageView] = []
    private var labelArray: [UILabel] = []
    private var photoSize: CGFloat = 40

    //MARK: - UI Elements

    private var rulesLabel: UILabel = {
        let label = UILabel()
        label.text = "Правила Игры"
        label.textColor = .purple
        label.numberOfLines = 0
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 32)
        return label
    }()

    private let textOne = DefaultHelpLabel(text: "Все игроки становятся в круг")
    private let textTwo = DefaultHelpLabel(text: "Первый игрок берёт телефон и нажимает кнопку: \n \n")
    private let textThree = DefaultHelpLabel(text: "На экране появляется вопрос “Назовите Фрукт”")
    private let textFour = DefaultHelpLabel(text: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку")
    private let textFive = DefaultHelpLabel(text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба")
    private let textSix = DefaultHelpLabel(text: "Проигравшим считается тот, в чьих руках взорвалась бомба")
    private let textSeven = DefaultHelpLabel(text: "Проигравший игрок должен выполнить задание")

    private var startGame: UIImageView = {
        let startGame = UIImageView()
        startGame.image = UIImage(named: "startGame")
        return startGame
    }()

    private var categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.textColor = .purple
        label.numberOfLines = 0
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 32)
        return label
    }()


    private var categoryTextOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "В игре доступно 6 категорий и более 90 вопросов"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 20)
        return label
    }()

    private var categoryTextTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Можно выбрать сразу несколько категорий для игры"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 20)
        return label
    }()

//    private lazy var kategoryImageView1: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "differentImage"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private lazy var kategoryImageView2: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "life"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private lazy var kategoryImageView3: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "sport"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private lazy var kategoryImageView4: UIImageView = {
//        let imageView = UIImageView(image: UIImage(named: "celebrities"))
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()

//    private lazy var topRowStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.alignment = .center
//        stackView.spacing = 10
//        stackView.addArrangedSubview(kategoryImageView1)
//        stackView.addArrangedSubview(kategoryImageView2)
//        return stackView
//    }()
//
//    private lazy var bottomRowStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        stackView.distribution = .fillEqually
//        stackView.alignment = .center
//        stackView.spacing = 10
//        stackView.addArrangedSubview(kategoryImageView3)
//        stackView.addArrangedSubview(kategoryImageView4)
//        return stackView
//    }()
//
    private lazy var categoriesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 15
        return stackView
    }()

    private lazy var firstRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 15
        return stackView
    }()

    private lazy var secondRowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 15
        return stackView
    }()

    private func createCategoryElement() {
        for i in 1...4 {
            let elementView = UIImageView(image: UIImage(named: "cat\(i)"))
            elementView.backgroundColor = .systemPurple
            elementView.layer.cornerRadius = 20
            elementView.layer.borderWidth = 1
            elementView.layer.borderColor = UIColor.black.cgColor

            if i <= 2 {
                firstRowStackView.addArrangedSubview(elementView)
            } else {
                secondRowStackView.addArrangedSubview(elementView)
            }
        }

        categoriesStackView.addArrangedSubview(firstRowStackView)
        categoriesStackView.addArrangedSubview(secondRowStackView)
    }


    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        createNumbers()
        createLabelPool()
        createCategoryElement()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods

    //перенести в отдельный файл
    //внести массивы с лейблами и вью вручную, не внутри функции
    private func createNumberView(_ number: Int) -> UIImageView? {
        if let image = UIImage (named: "helpViewImage\(number)") {
            let imageView = UIImageView(image: image)
            imageView.layer.cornerRadius = photoSize / 2
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            return imageView
        } else {
            return nil
        }
    }

//    private func createLabel(_ number: String) -> UILabel? {
//        if let label = UILabel() {
//            let label = DefaultHelpLabel(text: <#T##String#>)
//
//            return label
//        } else {
//            return nil
//        }
//    }

    private func createNumbers() {
        for i in 1...7 {
            if let imageView = createNumberView(i) {
                imageView.contentMode = .scaleAspectFill
                numberViews.append(imageView)
                self.addSubview(imageView)
            }
        }
    }

    private func createLabelPool() {
        labelArray.append(textOne)
        labelArray.append(textTwo)
        labelArray.append(textThree)
        labelArray.append(textFour)
        labelArray.append(textFive)
        labelArray.append(textSix)
        labelArray.append(textSeven)
        labelArray.forEach { self.addSubview($0) }
    }

//    private func createCategoryModel() -> [CategoryModel] {
//        let categoryViewPool = [
//            CategoryModel(name: "О разном", image: UIImage(named: "cat1") ?? UIImage()),
//            CategoryModel(name: "Спорт и хобби", image: UIImage(named: "cat2") ?? UIImage()),
//            CategoryModel(name: "Про жизнь", image: UIImage(named: "cat3") ?? UIImage()),
//            CategoryModel(name: "Знаменитости", image: UIImage(named: "cat4") ?? UIImage())
//        ]
//
//        return categoryViewPool
//    }

    private func layout() {

        [rulesLabel, startGame, categoryLabel, categoryTextOne, categoryTextTwo, categoriesStackView].forEach { self.addSubview($0) }

        let amongInset: CGFloat = 20

        rulesLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.centerX.equalToSuperview()
        }

        var previousView: UIView?
        var previousLabel: UILabel?

        for (index, view) in numberViews.enumerated() {
            let label = labelArray[index]

            view.snp.makeConstraints { make in
                make.width.equalTo(photoSize)
                make.height.equalTo(photoSize)
                make.leading.equalTo(self.snp.leading).inset(5)
                if let previousView = previousView {
                    make.top.equalTo(previousLabel!.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(rulesLabel.snp.bottom).offset(amongInset)
                }
            }

            label.snp.makeConstraints { make in
                make.leading.equalTo(view.snp.trailing).offset(4)
                make.top.equalTo(view.snp.top).inset(6)
                make.trailing.equalTo(self.snp.trailing).inset(photoSize)
            }

            previousView = view
            previousLabel = label
            }

        startGame.snp.makeConstraints { make in
            make.bottom.equalTo(labelArray[2].snp.top).inset(-12)
            make.centerX.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalTo(45)
        }

        categoryLabel.snp.makeConstraints { make in
            if let lastElement = labelArray.last {
                make.top.equalTo(lastElement.snp.bottom).offset(amongInset + 10)
                make.centerX.equalToSuperview()
            }
        }

        categoryTextOne.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(amongInset)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).inset(20)
        }

        categoryTextTwo.snp.makeConstraints { make in
            make.top.equalTo(categoryTextOne.snp.bottom).offset(amongInset)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(20)
            make.trailing.equalTo(self.snp.trailing).inset(20)
        }

        categoriesStackView.snp.makeConstraints { make in
            make.top.equalTo(categoryTextTwo.snp.bottom).offset(amongInset)
            make.leading.equalTo(self.snp.leading).offset(50)
            make.trailing.equalTo(self.snp.trailing).inset(50)
            make.height.equalTo(250)

        }

//            categoriesStackView.topAnchor.constraint(equalTo: categoryTextTwo.bottomAnchor, constant: 30),
//            categoriesStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
//            categoriesStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
//            categoriesStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
//            categoriesStackView.heightAnchor.constraint(equalToConstant: 400)
    }

    //MARK: - Button's targets

    @objc
    private func backButtonAction(){
        print ("tapped back button")
    }

}
