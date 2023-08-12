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

    private let textOne = DefaultHelpLabel(text: "Все игроки становятся в круг.")

    private let textTwo = DefaultHelpLabel(text: "Первый игрок берет телефон и нажимает кнопку:")

    private let textThree = DefaultHelpLabel(text: "На экране появляется вопрос “Назовите Фрукт”.")

    private let textFour = DefaultHelpLabel(text: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку (правильность ответа определяют другие участники).")


    private let textFive = DefaultHelpLabel(text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.")

    private let textSix = DefaultHelpLabel(text: "Проигравшим считается тот, в чьих руках взорвалась бомба.")

    private let textSeven = DefaultHelpLabel(text: "Проигравший игрок выполняет задания")

    private var numberOne: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "numberOne")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private var numberTwo: UIImageView = {
        let imageTwo = UIImageView()
        imageTwo.image = UIImage(named: "numberTwo")
        imageTwo.translatesAutoresizingMaskIntoConstraints = false

        return imageTwo
    }()

    private var numberThree: UIImageView = {
        let imageThree = UIImageView()
        imageThree.image = UIImage(named: "numberThree")
        imageThree.translatesAutoresizingMaskIntoConstraints = false

        return imageThree
    }()

    private var numberFour: UIImageView = {
        let numberFour = UIImageView()
        numberFour.image = UIImage(named: "numberFour")
        numberFour.translatesAutoresizingMaskIntoConstraints = false

        return numberFour
    }()

    private var numberFive: UIImageView = {
        let numberFive = UIImageView()
        numberFive.image = UIImage(named: "numberFive")
        numberFive.translatesAutoresizingMaskIntoConstraints = false

        return numberFive
    }()

    private var numberSix: UIImageView = {
        let numberSix = UIImageView()
        numberSix.image = UIImage(named: "numberSix")
        numberSix.translatesAutoresizingMaskIntoConstraints = false

        return numberSix
    }()

    private var numberSeven: UIImageView = {
        let numberSeven = UIImageView()
        numberSeven.image = UIImage(named: "numberSeven")
        numberSeven.translatesAutoresizingMaskIntoConstraints = false

        return numberSeven
    }()

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

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func layout(){

        addSubview(backgroungImageView)
        addSubview(textThree)
        addSubview(headerLabel)
        addSubview(textOne)
        addSubview(textTwo)
        addSubview(startGame)
        addSubview(textFour)
        addSubview(textFive)
        addSubview(numberTwo)
        addSubview(numberOne)
        addSubview(numberThree)
        addSubview(numberFour)
        addSubview(numberFive)
        addSubview(textSix)
        addSubview(textSeven)
        addSubview(numberSix)
        addSubview(numberSeven)


        NSLayoutConstraint.activate([

            backgroungImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            backgroungImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroungImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroungImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),


            headerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

            textOne.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 61),
            textOne.centerXAnchor.constraint(equalTo: centerXAnchor),

            numberOne.topAnchor.constraint(equalTo: headerLabel.topAnchor, constant: 40),
            numberOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            numberOne.heightAnchor.constraint(equalToConstant: 70),
            numberOne.widthAnchor.constraint(equalToConstant: 70),

            numberThree.topAnchor.constraint(equalTo: startGame.topAnchor, constant: 30 ),
            numberThree.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            numberThree.heightAnchor.constraint(equalToConstant: 70),
            numberThree.widthAnchor.constraint(equalToConstant: 70),


            numberFour.topAnchor.constraint(equalTo: textThree.topAnchor, constant: 53),
            numberFour.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            numberFour.heightAnchor.constraint(equalToConstant: 70),
            numberFour.widthAnchor.constraint(equalToConstant: 70),


            numberFive.topAnchor.constraint(equalTo: textFour.topAnchor, constant: 115),
            numberFive.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            numberFive.heightAnchor.constraint(equalToConstant: 70),
            numberFive.widthAnchor.constraint(equalToConstant: 70),

            numberSix.topAnchor.constraint(equalTo: textFive.topAnchor, constant: 61),
            numberSix.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            numberSix.heightAnchor.constraint(equalToConstant: 70),
            numberSix.widthAnchor.constraint(equalToConstant: 70),

            numberSeven.topAnchor.constraint(equalTo: textSix.topAnchor, constant: 44),
            numberSeven.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            numberSeven.heightAnchor.constraint(equalToConstant: 70),
            numberSeven.widthAnchor.constraint(equalToConstant: 70),


            numberTwo.topAnchor.constraint(equalTo: numberOne.topAnchor, constant: 61),
            numberTwo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 1),
            numberTwo.heightAnchor.constraint(equalToConstant: 70),
            numberTwo.widthAnchor.constraint(equalToConstant: 70),

            textTwo.topAnchor.constraint(equalTo: self.textOne.topAnchor, constant: 61),
            textTwo.centerXAnchor.constraint(equalTo: centerXAnchor),
            textTwo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            startGame.topAnchor.constraint(equalTo: self.textTwo.topAnchor, constant: 35),
            startGame.centerXAnchor.constraint(equalTo: centerXAnchor),
            startGame.heightAnchor.constraint(equalToConstant: 70),
            startGame.widthAnchor.constraint(equalToConstant: 150),



            textThree.topAnchor.constraint(equalTo: self.startGame.topAnchor, constant: 53),
            textThree.centerXAnchor.constraint(equalTo: centerXAnchor),
            textThree.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            textFour.topAnchor.constraint(equalTo: self.textThree.topAnchor, constant: 74),
            textFour.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFour.leftAnchor.constraint(equalTo: numberFour.leftAnchor, constant: 47),
            textFour.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),


            textFive.topAnchor.constraint(equalTo: self.textFour.topAnchor, constant: 137),
            textFive.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFive.leftAnchor.constraint(equalTo: numberFive.leftAnchor, constant: 46),
            textFive.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

            textSix.topAnchor.constraint(equalTo: textFive.topAnchor, constant: 81),
            textSix.centerXAnchor.constraint(equalTo: centerXAnchor),
            textSix.leftAnchor.constraint(equalTo: numberSix.leftAnchor, constant: 37),
            textSix.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),


            textSeven.topAnchor.constraint(equalTo: textSix.topAnchor, constant: 64),
            textSeven.centerXAnchor.constraint(equalTo: centerXAnchor),
            textSeven.leftAnchor.constraint(equalTo: numberSeven.leftAnchor, constant: 30),
            textSeven.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),

        ])
    }
}
