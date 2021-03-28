//
//  Login.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//

import Foundation

struct Login {
    var username: String
    var password: String
    
    init (username: String, password: String) {
        self.username = username
        self.password = password
    }
}

struct Signup {
    var username: String
    var password: String
    var email: String
    
    init (username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
}
