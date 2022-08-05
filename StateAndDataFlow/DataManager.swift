//
//  DataManager.swift
//  StateAndDataFlow
//
//  Created by Игорь Богданов on 04.08.2022.
//

import SwiftUI

class DataManager {
    static let shared = DataManager()
    
    @AppStorage("userName") private var userData: Data?
    
    private  init() {}
    
    func loadUserData() -> User {
        guard let user = try? JSONDecoder().decode(User.self, from: userData ?? Data()) else {return User()}
        return user
    }
    
    func saveUserData(_ user: User) {
        userData = try? JSONEncoder().encode(user)
    }
    
    func clearUserData(_ manager: UserManager) {
        manager.user.isRegistered =  false
        manager.user.name = ""
        userData = nil
    }
}
