//
//  HelpView.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import Foundation
import UIKit

class HelpView: UIView {

    private var headerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Правила Игры"
        label.textColor = .purple
        label.numberOfLines = 0
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 32)
        return label
    }()

    private var categoryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Категории"
        label.textColor = .purple
        label.numberOfLines = 0
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 32)
        return label
    }()

    private let textOne = DefaultHelpLabel(text: " Все игроки становятся в круг")
    private let textTwo = DefaultHelpLabel(text: "Первый игрок берет телефон и нажимает кнопку:")
    private let textThree = DefaultHelpLabel(text: "На экране появляется вопрос “Назовите Фрукт”")
    private let textFour = DefaultHelpLabel(text: " Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники)")
    private let textFive = DefaultHelpLabel(text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба")
    private let textSix = DefaultHelpLabel(text: "Проигравшим считается тот, в чьих руках взорвалась бомба")
    private let textSeven = DefaultHelpLabel(text: "Проигравший игрок должен выполнить задание")

    private var startGame: UIImageView = {
        let startGame = UIImageView()
        startGame.image = UIImage(named: "startGame")
        startGame.translatesAutoresizingMaskIntoConstraints = false
        return startGame
    }()

    private var categoryTextOne: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "В игре доступно 6 категорий и более 90 вопросов"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 26)
        return label
    }()

    private var categoryTextTwo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Можно выбрать сразу несколько категорий для игры"
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 26)
        return label
    }()

    var numberViews: [UIImageView] = []
    private let photoSize: CGFloat = 45

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createNumberView(_ number: Int) -> UIImageView? {
        if let image = UIImage (named: "helpViewImage\(number)") {
            let imageView = UIImageView(image: image)
            imageView.layer.cornerRadius = photoSize / 2
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        } else {
            return nil
        }
    }

    private func createNumbers() {
        for i in 1...7 {
            if let imageView = createNumberView(i) {
                imageView.contentMode = .scaleAspectFill
                numberViews.append(imageView)
                self.addSubview(imageView)
            }
        }
    }

    private func layout(){

        [headerLabel, startGame, textOne, textTwo, textThree, textFour, textFive, textSix, textSeven, categoryLabel, categoryTextOne, categoryTextTwo].forEach { self.addSubview($0) }
        createNumbers()

        let imageLeftnset: CGFloat = 10
        let amongInset: CGFloat = 10
        let imageSize: CGFloat = 45
        let imageLabelInset: CGFloat = 10
        let textRightInset: CGFloat = 40

        NSLayoutConstraint.activate([

            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            numberViews[0].topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
            numberViews[0].leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageLeftnset),
            numberViews[0].heightAnchor.constraint(equalToConstant: imageSize),
            numberViews[0].widthAnchor.constraint(equalToConstant: imageSize),

            textOne.centerYAnchor.constraint(equalTo: numberViews[0].centerYAnchor),
            textOne.leadingAnchor.constraint(equalTo: numberViews[0].trailingAnchor, constant: imageLabelInset),

            numberViews[1].topAnchor.constraint(equalTo: numberViews[0].bottomAnchor, constant: 20),
            numberViews[1].leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageLeftnset),
            numberViews[1].heightAnchor.constraint(equalToConstant: imageSize),
            numberViews[1].widthAnchor.constraint(equalToConstant: imageSize),

            textTwo.centerYAnchor.constraint(equalTo: numberViews[1].centerYAnchor, constant: 10),
            textTwo.leadingAnchor.constraint(equalTo: numberViews[1].trailingAnchor, constant: imageLabelInset),
            textTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -textRightInset),

            startGame.topAnchor.constraint(equalTo: textTwo.bottomAnchor, constant: 7),
            startGame.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 5),
            startGame.heightAnchor.constraint(equalToConstant: 40),
            startGame.widthAnchor.constraint(equalToConstant: 140),

            numberViews[2].topAnchor.constraint(equalTo: startGame.bottomAnchor, constant: amongInset),
            numberViews[2].leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageLeftnset),
            numberViews[2].heightAnchor.constraint(equalToConstant: imageSize),
            numberViews[2].widthAnchor.constraint(equalToConstant: imageSize),

            textThree.centerYAnchor.constraint(equalTo: numberViews[2].centerYAnchor, constant: 10),
            textThree.leadingAnchor.constraint(equalTo: numberViews[2].trailingAnchor, constant: imageLabelInset),
            textThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -textRightInset),

            numberViews[3].topAnchor.constraint(equalTo: numberViews[2].bottomAnchor, constant: 30),
            numberViews[3].leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageLeftnset),
            numberViews[3].heightAnchor.constraint(equalToConstant: imageSize),
            numberViews[3].widthAnchor.constraint(equalToConstant: imageSize),

            textFour.topAnchor.constraint(equalTo: textThree.bottomAnchor, constant: amongInset + 7),
            textFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageLabelInset + 22),
            textFour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -textRightInset),

            numberViews[4].topAnchor.constraint(equalTo: textFour.bottomAnchor, constant: 20),
            numberViews[4].leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageLeftnset),
            numberViews[4].heightAnchor.constraint(equalToConstant: imageSize),
            numberViews[4].widthAnchor.constraint(equalToConstant: imageSize),

            textFive.topAnchor.constraint(equalTo: textFour.bottomAnchor, constant: amongInset + 7),
            textFive.leadingAnchor.constraint(equalTo: numberViews[4].trailingAnchor, constant: imageLabelInset),
            textFive.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -textRightInset),

            numberViews[5].topAnchor.constraint(equalTo: textFive.bottomAnchor, constant: amongInset + 7),
            numberViews[5].leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageLeftnset),
            numberViews[5].heightAnchor.constraint(equalToConstant: imageSize),
            numberViews[5].widthAnchor.constraint(equalToConstant: imageSize),

            textSix.topAnchor.constraint(equalTo: textFive.bottomAnchor, constant: amongInset + 7),
            textSix.leadingAnchor.constraint(equalTo: numberViews[5].trailingAnchor, constant: imageLabelInset),
            textSix.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -textRightInset),

            numberViews[6].topAnchor.constraint(equalTo: textSix.bottomAnchor, constant: amongInset),
            numberViews[6].leadingAnchor.constraint(equalTo: leadingAnchor, constant: imageLeftnset),
            numberViews[6].heightAnchor.constraint(equalToConstant: imageSize),
            numberViews[6].widthAnchor.constraint(equalToConstant: imageSize),

            textSeven.topAnchor.constraint(equalTo: textSix.bottomAnchor, constant: amongInset + 7),
            textSeven.leadingAnchor.constraint(equalTo: numberViews[6].trailingAnchor, constant: imageLabelInset),
            textSeven.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -textRightInset),

            categoryLabel.topAnchor.constraint(equalTo: textSeven.bottomAnchor, constant: 30),
            categoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            categoryTextOne.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 15),
            categoryTextOne.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryTextOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            categoryTextOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

            categoryTextTwo.topAnchor.constraint(equalTo: categoryTextOne.bottomAnchor, constant: 30),
            categoryTextTwo.centerXAnchor.constraint(equalTo: centerXAnchor),
            categoryTextTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            categoryTextTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),

        ])
    }
}
