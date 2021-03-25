//
//  RoomDetailContract.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol RoomDetailEntityContract: BaseEntity {
    
}

protocol RoomDetailViewContract: BaseViewController {
    var presenter: RoomDetailPresenterContract! { get set }
    
}

protocol RoomDetailPresenterContract: BasePresenter {
    var view: RoomDetailViewContract! { get set }
    var interactor: RoomDetailInteractorContract! { get set }
    var entity: RoomDetailEntityContract! { get set }
    var wireframe: RoomDetailWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
}

protocol RoomDetailInteractorContract: BaseInteractor {
    var output: RoomDetailInteractorOutputContract! {get set}
}

protocol RoomDetailInteractorOutputContract: class {
    
}

protocol RoomDetailWireframeContract: BaseWireframe {
    var output: RoomDetailWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol RoomDetailWireframeOutputContract: class {

}
