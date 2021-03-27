//
//  LoginPresenter.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class LoginPresenter: BasePresenter, LoginPresenterContract {

    weak var view: LoginViewContract!
    var interactor: LoginInteractorContract!
    var entity: LoginEntityContract!
    var wireframe: LoginWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {

    }
}


// MARK: - LoginInteractorOutputContract
extension LoginPresenter: LoginInteractorOutputContract {
    
}

// MARK: - LoginWireframeOutputContract
extension LoginPresenter: LoginWireframeOutputContract {
    
}
