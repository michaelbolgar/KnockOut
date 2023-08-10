//
//  ViewController.swift
//  Dice with code
//  Created by Zhaniya on 20.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.delegate = self
        view.dataSource = self
        view.register(CustomCell.self, forCellWithReuseIdentifier: "cell")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    
    let backgroungImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCell
        cell.categoryImageView.image = category[indexPath.row]
        return cell
    }
    
    

}
