//
//  CollectionView.swift
//  Knock out!
//
//  Created by Михаил Болгар on 22.08.2023.
//

import UIKit

class CustomCollectionView: UICollectionView {

    override var intrinsicContentSize: CGSize {
           return self.collectionViewLayout.collectionViewContentSize
       }
}
