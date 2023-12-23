//
//  UserDefultsService.swift
//  Inlet
//
//  Created by Maxim Fedoseenko on 03.12.2023.
//

import Foundation

final class UserDefultsService {
    
    static func saveUserModel(userModel: UserModel) {
        UserDefaults.standard.set(userModel.name, forKey: UserDefaults.Keys.name.rawValue)
        UserDefaults.standard.set(userModel.email, forKey: UserDefaults.Keys.email.rawValue)
        UserDefaults.standard.set(userModel.password, forKey: UserDefaults.Keys.password.rawValue)
    }
    
    static func getUserModel() -> UserModel? {
        let name = UserDefaults.standard.string(forKey: UserDefaults.Keys.name.rawValue)
        guard let email = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue),
              let password = UserDefaults.standard.string(forKey: UserDefaults.Keys.email.rawValue) else { return nil }
        let userModel = UserModel(name: name, email: email, password: password)
        return userModel
    }
    
    static func cleanUserDefauts() {
        UserDefaults.standard.reset()
    }
}

