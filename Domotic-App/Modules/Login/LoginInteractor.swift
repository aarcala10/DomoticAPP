//
//  LoginInteractor.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class LoginInteractor: BaseInteractor, LoginInteractorContract {
    weak var output: LoginInteractorOutputContract!

    var networkProvider: MyProviderContract
    
    init (provider: MyProviderContract) {
        self.networkProvider = provider
    }
}
