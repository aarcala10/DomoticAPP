//
//  LoginInteractor.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class LoginInteractor: BaseInteractor, LoginInteractorContract {
    
    weak var output: LoginInteractorOutputContract!

    var loginProvider: LoginProviderContract
    
    init (provider: LoginProviderContract) {
        self.loginProvider = provider
    }
    
    func login(login: Login) -> Promise<Bool> {
        return Promise<Bool> { promise in
            firstly {
                self.loginProvider.login(login: login)
            }.done { result in
                promise.fulfill(result)
            }.cauterize()
        }
    }
    
    func signup(signup: Signup) -> Promise<Bool> {
        return Promise<Bool> { promise in
            firstly {
                self.loginProvider.signup(signup: signup)
            }.done { result in
                promise.fulfill(result)
            }.cauterize()
        }
    }
}
