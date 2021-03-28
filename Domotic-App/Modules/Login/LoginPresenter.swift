//
//  LoginPresenter.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class LoginPresenter: BasePresenter, LoginPresenterContract {
    
    weak var view: LoginViewContract!
    var interactor: LoginInteractorContract!
    var entity: LoginEntityContract!
    var wireframe: LoginWireframeContract!
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func login(login: Login) {
        firstly {
            interactor.login(login: login)
        }.done { [weak self] loged in
            if loged {
                self?.view.showAlertPopUp(message: "LogIn is Succesfull!!")
            }else {self?.view.showAlertPopUp(message: "An error has occurred")}
        }.catch { error in
            self.view.feedbackError(error: error)
        }
    }
    
    func signup(signup: Signup) {
        firstly {
            interactor.signup(signup: signup)
        }.done { [weak self] signed in
            if signed {
                self?.view.showAlertPopUp(message: "An error has occurred")
            } else {}
        }.catch { error in
            self.view.feedbackError(error: error)
        }
    }
}


// MARK: - LoginInteractorOutputContract
extension LoginPresenter: LoginInteractorOutputContract {
    
}

// MARK: - LoginWireframeOutputContract
extension LoginPresenter: LoginWireframeOutputContract {
    
}
