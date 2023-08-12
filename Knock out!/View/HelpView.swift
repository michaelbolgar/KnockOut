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

    private let textOne = DefaultHelpLabel(text: "Все игроки становятся в круг")

    private let textTwo = DefaultHelpLabel(text: "Первый игрок берет телефон и нажимает кнопку:")

    private let textThree = DefaultHelpLabel(text: "На экране появляется вопрос “Назовите Фрукт”")

    private let textFour = DefaultHelpLabel(text: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники)")

    private let textFive = DefaultHelpLabel(text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба")

    private let textSix = DefaultHelpLabel(text: "Проигравшим считается тот, в чьих руках взорвалась бомба")

    private let textSeven = DefaultHelpLabel(text: "Проигравший игрок выполняет задания")

    private var startGame: UIImageView = {
        let startGame = UIImageView()
        startGame.image = UIImage(named: "startGame")
        startGame.translatesAutoresizingMaskIntoConstraints = false

        return startGame
    }()

    let backgroungImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "background")
            imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()

//    private let number1: UIImageView = {
//        let image = UIImageView()
//        image.image = HelpViewNumberImages.makeImage(number: 1)
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.backgroundColor = .white
//        return image
//    }()

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    private let numberModel = HelpViewNumberImages.makeImage(number: <#T##Int#>)
//
//    let numberImage = HelpViewNumberImages.makeImage()
//    let numberImageView = HelpViewImageView.makeImageView()
//
//    private func makeNumber(image: UIImage) -> [numberImageView] {
//        let numberModel = UIImageView()
//        let image = UIImage()
//        for i in 1...7 {
//            numberModel.translatesAutoresizingMaskIntoConstraints = false
//            numberModel.backgroundColor = .white
//        }
//        return [numberModel]
//    }

    var numberViews: [UIImageView] = []

    private func createNumberView(_ number: Int) -> UIImageView? {
        if let image = UIImage (named: "helpViewImage\(number)") {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleToFill
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
                imageView.backgroundColor = .white
                numberViews.append(imageView)
                self.addSubview(imageView)
            }
        }
    }

    private func layout(){

        [backgroungImageView, headerLabel, textOne, textTwo].forEach { self.addSubview($0) }
        createNumbers()

//        let inset: CGFloat = 20

        NSLayoutConstraint.activate([

            backgroungImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroungImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroungImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroungImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

//            numberViews[0].topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 10),
//            numberViews[0].leadingAnchor.constraint(equalTo: leadingAnchor),
//            numberViews[0].heightAnchor.constraint(equalToConstant: 60),
//            numberViews[0].widthAnchor.constraint(equalToConstant: 60),

//            textOne.centerYAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 40),
//            textOne.centerXAnchor.constraint(equalTo: centerXAnchor),
//
//            numberViews[1].topAnchor.constraint(equalTo: numberViews[0].bottomAnchor, constant: 20),
//            numberViews[1].leadingAnchor.constraint(equalTo: leadingAnchor),
//            numberViews[1].heightAnchor.constraint(equalToConstant: 70),
//            numberViews[1].widthAnchor.constraint(equalToConstant: 70),

//            textOne.centerXAnchor.constraint(equalTo: centerXAnchor),
//            textTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 61),
//            textTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -61),
//            textTwo.topAnchor.constraint(equalTo: textOne.bottomAnchor, constant: inset)

//            numberViews[2].topAnchor.constraint(equalTo: numberViews[1].bottomAnchor, constant: 40),
//            numberViews[2].leadingAnchor.constraint(equalTo: leadingAnchor),
//            numberViews[2].heightAnchor.constraint(equalToConstant: 70),
//            numberViews[2].widthAnchor.constraint(equalToConstant: 70),
//
//            numberViews[3].topAnchor.constraint(equalTo: numberViews[2].bottomAnchor, constant: 40),
//            numberViews[3].leadingAnchor.constraint(equalTo: leadingAnchor),
//            numberViews[3].heightAnchor.constraint(equalToConstant: 70),
//            numberViews[3].widthAnchor.constraint(equalToConstant: 70),
//
//            numberViews[4].topAnchor.constraint(equalTo: numberViews[3].bottomAnchor, constant: 20),
//            numberViews[4].leadingAnchor.constraint(equalTo: leadingAnchor),
//            numberViews[4].heightAnchor.constraint(equalToConstant: 70),
//            numberViews[4].widthAnchor.constraint(equalToConstant: 70),
//
//            numberViews[5].topAnchor.constraint(equalTo: numberViews[4].bottomAnchor, constant: 20),
//            numberViews[5].leadingAnchor.constraint(equalTo: leadingAnchor),
//            numberViews[5].heightAnchor.constraint(equalToConstant: 70),
//            numberViews[5].widthAnchor.constraint(equalToConstant: 70),
//
//            numberViews[6].topAnchor.constraint(equalTo: numberViews[5].bottomAnchor, constant: 20),
//            numberViews[6].leadingAnchor.constraint(equalTo: leadingAnchor),
//            numberViews[6].heightAnchor.constraint(equalToConstant: 70),
//            numberViews[6].widthAnchor.constraint(equalToConstant: 70),
//
//            startGame.topAnchor.constraint(equalTo: self.textTwo.topAnchor, constant: 35),
//            startGame.centerXAnchor.constraint(equalTo: centerXAnchor),
//            startGame.heightAnchor.constraint(equalToConstant: 70),
//            startGame.widthAnchor.constraint(equalToConstant: 150),

        ])
    }
}
