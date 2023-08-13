//
//  UserDefaults.swift
//  Knock out!
//
//  Created by sidzhe on 09.08.2023.
//

import UIKit

//MARK: - UserDefaultsProtocol

protocol UserDefaultsProtocol: AnyObject {
    var count: Int? { get set }
    var header: String? { get set }
    func save()
    func loadUsedDef() -> UIViewController?
}


//MARK: - UserDef

class UserDef: UserDefaultsProtocol {
    
    //MARK: - Properties
    
    var count: Int?
    
    var header: String?
    
    static let shared = UserDef()
    
    let defaults = UserDefaults.standard
    
    //MARK: - Init
    
    private init() {}
    
    //MARK: - Methods
    
    func save() {
        defaults.setValue(count, forKey: "count")
        defaults.setValue(header, forKey: "header")
    }
    
    func loadUsedDef() -> UIViewController? {
        print("ХУЙ")
        guard let countValue = defaults.object(forKey: "count") as? Int,
              let headerText = defaults.object(forKey: "header") as? String else { return nil }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let gameVC = appDelegate.currentGameVC else { return nil }
        
        gameVC.load(count: countValue, header: headerText)
        
        defaults.setValue(nil, forKey: "count")
        defaults.setValue(nil, forKey: "header")
        
        return gameVC
    }
    
    func checkState() -> Bool {
        
        guard defaults.object(forKey: "count") != nil,
              defaults.object(forKey: "header") != nil else { return false }
       
        return true
    }
}
