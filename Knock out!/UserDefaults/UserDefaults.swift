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
    
    private let defaults = UserDefaults.standard
    
    //MARK: - Init
    
    private init() {}
    
    //MARK: - Methods
    
    func save() {
        defaults.setValue(count, forKey: "count")
        defaults.setValue(header, forKey: "header")
    }
    
    func loadUsedDef() -> UIViewController? {

        guard let countValue = defaults.object(forKey: "count") as? Int,
              let headerText = defaults.object(forKey: "header") as? String else { return nil }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate,
              let gameVC = appDelegate.currentGameVC else { return nil }
        gameVC.load(count: countValue, header: headerText)
        
        defaults.set(nil, forKey: "count")
        defaults.set(nil, forKey: "header")
        
        return gameVC
    }
}
