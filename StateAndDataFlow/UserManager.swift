//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by brubru on 21.02.2022.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var user = User()
    
    var isNameValid:Bool {
        user.name.count >= 3 ? true : false
    }
    
    init(user: User) {
        self.user = user
    }
    
    init(){}
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
