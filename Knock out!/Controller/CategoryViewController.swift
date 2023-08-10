//
//  ViewController.swift
//  Dice with code
//  Created by Zhaniya on 20.07.2023.
//

import UIKit

class CategoryViewController: UIViewController {

    //нужно ещё добавить лейбл по макету

    //нужно также добавить картинку на ячейку и настроить появление галочки по тапу

    //лучше отредактировать размер коллекшвью, а именно задать констрейнты с привязкой к краям экрана и без конкретной длины. Тогда коллекшнвью будет растягиваться в зависимости от размеров экрана (что очень актуально, так как есть айфоны разных размеров) и количества ячеек
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 150, height: 150)
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

    //лучше сделать генерацию ячеек через цикл for in 1-4, чтобы не добавлять каждую ячейку вручную. Тогда у тебя будет одна картинка для всех (остальное можно будет удалить из ассетов) + можно будет в случае необходимости обновить код и добавить новые ячейки, просто увеличив число 4, без того чтобы вручную создавать новые объекты в массиве

    let category = [UIImage(named: "p1") , UIImage(named: "p2") , UIImage(named: "p3") , UIImage(named: "p4") , UIImage(named: "p5") , UIImage(named: "p6")]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        view.addSubview(backgroungImageView)
        view.addSubview(collectionView)
        
        backgroungImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroungImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroungImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroungImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor , constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        
    }
}

extension CategoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.categoryImageView.image = category[indexPath.row]
        return cell
    }  
}
