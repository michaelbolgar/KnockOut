import Foundation
import UIKit
import SnapKit

class HelpView: UIView {

    //MARK: - Properties

    private var numberViews: [UIImageView] = []
    private var labelArray: [UILabel] = []
    private var photoSize: CGFloat = 36

    //MARK: - UI Elements

    private lazy var rulesLabel = UILabel.makeLabel(text: "Правила игры",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 32),
                                                   textColor: .black,
                                                   numberOfLines: 1)

    private lazy var text1 = UILabel.makeHelpLabel(text: "Все игроки становятся в круг")
    private lazy var text2 = UILabel.makeHelpLabel(text: "Первый игрок берёт телефон и нажимает кнопку: \n")
    private lazy var text3 = UILabel.makeHelpLabel(text: "На экране появляется вопрос “Назовите Фрукт”")
    private lazy var text4 = UILabel.makeHelpLabel(text: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку")
    private lazy var text5 = UILabel.makeHelpLabel(text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба")
    private lazy var text6 = UILabel.makeHelpLabel(text: "Проигравшим считается тот, в чьих руках взорвалась бомба")
    private lazy var text7 = UILabel.makeHelpLabel(text: "Проигравший игрок должен выполнить задание")

    private var startGame: UIImageView = {
        let startGame = UIImageView()
        startGame.image = UIImage(named: "startGameYellow")
        startGame.contentMode = .scaleAspectFill
        startGame.layer.shadowColor = UIColor.black.cgColor
        startGame.layer.shadowOpacity = 0.5
        startGame.layer.shadowOffset = CGSize(width: 0, height: 2)
        startGame.layer.shadowRadius = 4
        return startGame
    }()

    private lazy var categoryLabel = UILabel.makeLabel(text: "Категории",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 32),
                                                   textColor: .black,
                                                   numberOfLines: 1)

    private lazy var categoryTextOne = UILabel.makeLabel(text: "В игре доступно 6 категорий и более 90 вопросов",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 20),
                                                   textColor: .black,
                                                   numberOfLines: 0)

    private lazy var categoryTextTwo = UILabel.makeLabel(text: "Можно выбрать сразу несколько категорий для игры",
                                                   font: UIFont(name: "DelaGothicOne-Regular", size: 20),
                                                   textColor: .black,
                                                   numberOfLines: 0)

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: CategoryViewController.cellSize, height: CategoryViewController.cellSize)
        layout.minimumLineSpacing = 12
        view.delegate = self
        view.dataSource = self
        view.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        view.backgroundColor = .clear
        return view
    }()

    //MARK: - Init

    override init (frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        createNumbers()
        createLabelPool()
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Methods

    private func createNumberView(_ number: Int) -> UIImageView? {
        if let image = UIImage (named: "number\(number)") {
            let imageView = UIImageView(image: image)
            imageView.layer.cornerRadius = photoSize / 2
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            return imageView
        } else {
            return nil
        }
    }

    private func createNumbers() {
        for i in 1...7 {
            if let imageView = createNumberView(i) {
                numberViews.append(imageView)
                self.addSubview(imageView)
            }
        }
    }

    private func createLabelPool() {
        labelArray.append(text1)
        labelArray.append(text2)
        labelArray.append(text3)
        labelArray.append(text4)
        labelArray.append(text5)
        labelArray.append(text6)
        labelArray.append(text7)
        labelArray.forEach { self.addSubview($0) }
    }

    private func layout() {

        let amongInset: CGFloat = 20

        [rulesLabel, startGame, categoryLabel, categoryTextOne, categoryTextTwo, collectionView].forEach { self.addSubview($0) }

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
                if previousView != nil {
                    make.top.equalTo(previousLabel!.snp.bottom).offset(10)
                } else {
                    make.top.equalTo(rulesLabel.snp.bottom).offset(amongInset)
                }
            }

            label.snp.makeConstraints { make in
                make.leading.equalTo(view.snp.trailing).offset(4)
                make.top.equalTo(view.snp.top).inset(3)
                make.trailing.equalTo(self.snp.trailing).inset(photoSize)
            }

            previousView = view
            previousLabel = label
            }

        startGame.snp.makeConstraints { make in
            make.top.equalTo(labelArray[1].snp.bottom).inset(12)
            make.centerX.equalToSuperview()
            make.width.equalTo(130)
            make.height.equalTo(25)
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

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(categoryTextTwo.snp.bottom).offset(amongInset)
            make.centerX.equalToSuperview()
            make.leading.equalTo(self.snp.leading).offset(30)
            make.trailing.equalTo(self.snp.trailing).inset(30)
            make.bottom.equalToSuperview().inset(amongInset)
        }
    }
}

    //MARK: - Extension UICollectionViewDataSource, UICollectionViewDelegate

extension HelpView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.contentView.layer.cornerRadius = 45
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.configure(ExerciseModel.shared.getCategoryModel()[indexPath.row])
        cell.checkButton.isHidden = true

        return cell
    }
}
