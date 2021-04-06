//
//  LoginNetworkProvider.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//

import Foundation
import Alamofire
import PromiseKit

protocol LoginProviderContract {
    func login(login: Login) -> Promise<Bool>
    func signup(signup: Signup) -> Promise<Bool>
}

class LoginNetworkProvider: LoginProviderContract {
    func login(login: Login) -> Promise<Bool> {
        return self.logIn(login: login)
    }
    
    func signup(signup: Signup) -> Promise<Bool> {
        return self.signUp(signup: signup)
    }
    
    private func logIn(login: Login) -> Promise<Bool> {
        return Promise<Bool> { promise in
            
            promise.fulfill(true)
        }
    }
    
    private func signUp(signup: Signup) -> Promise<Bool> {
        return Promise<Bool> { promise in
            
            promise.fulfill(true)
        }
    }

}
