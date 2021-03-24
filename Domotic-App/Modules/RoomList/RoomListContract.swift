//
//  RoomListContract.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol RoomListEntityContract: BaseEntity {
    
}

protocol RoomListViewContract: BaseViewController {
    var presenter: RoomListPresenterContract! { get set }
    
}

protocol RoomListPresenterContract: BasePresenter {
    var view: RoomListViewContract! { get set }
    var interactor: RoomListInteractorContract! { get set }
    var entity: RoomListEntityContract! { get set }
    var wireframe: RoomListWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
}

protocol RoomListInteractorContract: BaseInteractor {
    var output: RoomListInteractorOutputContract! {get set}
}

protocol RoomListInteractorOutputContract: class {
    
}

protocol RoomListWireframeContract: BaseWireframe {
    var output: RoomListWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol RoomListWireframeOutputContract: class {

}
