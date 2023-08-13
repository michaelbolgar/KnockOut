//
//  KategoryView.swift
//  Knock out!
//
//  Created by Михаил Болгар on 07.08.2023.
//

import Foundation
import UIKit
import SnapKit

class CategoryViewController: UIViewController {

    //MARK: - Properties

    private var model = [
        CategoryModel(name: "О разном", image: UIImage(named: "cat1") ?? UIImage()),
        CategoryModel(name: "Спорт и хобби", image: UIImage(named: "cat2") ?? UIImage()),
        CategoryModel(name: "Про жизнь", image: UIImage(named: "cat3") ?? UIImage()),
        CategoryModel(name: "Знаменитости", image: UIImage(named: "cat4") ?? UIImage()),
        CategoryModel(name: "Искусство и кино", image: UIImage(named: "cat5") ?? UIImage()),
        CategoryModel(name: "Природа", image: UIImage(named: "cat6") ?? UIImage())
    ]

    //MARK: - UI Elements

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 174, height: 174)
        layout.minimumLineSpacing = 12
        view.delegate = self
        view.dataSource = self
        view.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    let backgroungImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Категории"
        label.textAlignment = .center
        label.textColor = .purple
        label.font = UIFont(name: "DelaGothicOne-Regular", size: 30)
        return label
    }()

    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem(image: UIImage(systemName: "chevron.backward.circle.fill"), style: .done, target: self, action: #selector(tapBack))
        button.tintColor = .purple
        return button
    }()

    //MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

    }

    //MARK: - Methods

    private func setupViews() {

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.titleView = headerLabel
        navigationItem.leftBarButtonItem = backButton

        view.addSubview(backgroungImageView)
        view.addSubview(collectionView)

        backgroungImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }

    @objc private func tapBack() {
        navigationController?.popToRootViewController(animated: true)
    }
}

//MARK: - Extension UICollectionViewDataSource, UICollectionViewDelegate

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell

        cell.contentView.layer.cornerRadius = 45
        cell.contentView.layer.borderWidth = 1
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.configure(model[indexPath.row])
        return cell
    }
}
