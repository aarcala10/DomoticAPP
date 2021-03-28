//
//  LoginContract.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol LoginEntityContract: BaseEntity {
    
}

protocol LoginViewContract: BaseViewController {
    var presenter: LoginPresenterContract! { get set }
    
}

protocol LoginPresenterContract: BasePresenter {
    var view: LoginViewContract! { get set }
    var interactor: LoginInteractorContract! { get set }
    var entity: LoginEntityContract! { get set }
    var wireframe: LoginWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
}

protocol LoginInteractorContract: BaseInteractor {
    var output: LoginInteractorOutputContract! {get set}
    
    func login(login: Login) -> Promise<Bool>
    func signup(signup: Signup) -> Promise<Bool>
}

protocol LoginInteractorOutputContract: class {
    
}

protocol LoginWireframeContract: BaseWireframe {
    var output: LoginWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol LoginWireframeOutputContract: class {

}
