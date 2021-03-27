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
    
    func updateData(rooms: [Room])
    func feedbackError(error: Error)
    
}

protocol RoomListPresenterContract: BasePresenter {
    var view: RoomListViewContract! { get set }
    var interactor: RoomListInteractorContract! { get set }
    var entity: RoomListEntityContract! { get set }
    var wireframe: RoomListWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
    
    func selectRoomCell(name: String)
}

protocol RoomListInteractorContract: BaseInteractor {
    var output: RoomListInteractorOutputContract! {get set}
    func getRoomsList() -> Promise<[Room]>
}

protocol RoomListInteractorOutputContract: class {
    
}

protocol RoomListWireframeContract: BaseWireframe {
    var output: RoomListWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
    func showDetailRoomView(room: String)
}

protocol RoomListWireframeOutputContract: class {

}
