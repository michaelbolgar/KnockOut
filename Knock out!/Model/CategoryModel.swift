//
//  CategoryModel.swift
//  Knock out!
//
//  Created by sidzhe on 12.08.2023.
//

import UIKit

struct CategoryModel {
    
    var name: String
    var image: UIImage
    var isSelected: Bool? = false
    
    var model: [CategoryModel]?
    
    mutating func getModel() {
        
        var model = [
            CategoryModel(name: "О размном", image: UIImage(named: "cat1") ?? UIImage()),
            CategoryModel(name: "Спорт и хобби", image: UIImage(named: "cat2") ?? UIImage()),
            CategoryModel(name: "Про жизнь", image: UIImage(named: "cat3") ?? UIImage()),
            CategoryModel(name: "Знаменитости", image: UIImage(named: "cat4") ?? UIImage()),
            CategoryModel(name: "Искусство и кино", image: UIImage(named: "cat5") ?? UIImage()),
            CategoryModel(name: "Природа", image: UIImage(named: "cat6") ?? UIImage())
        ]
        
        self.model = model
    }
    
//    func setModel() -> [CategoryModel] {
//        return
//    }
}
