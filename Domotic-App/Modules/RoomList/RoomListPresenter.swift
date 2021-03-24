//
//  RoomListPresenter.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class RoomListPresenter: BasePresenter, RoomListPresenterContract {

    weak var view: RoomListViewContract!
    var interactor: RoomListInteractorContract!
    var entity: RoomListEntityContract!
    var wireframe: RoomListWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {

    }
}


// MARK: - RoomListInteractorOutputContract
extension RoomListPresenter: RoomListInteractorOutputContract {
    
}

// MARK: - RoomListWireframeOutputContract
extension RoomListPresenter: RoomListWireframeOutputContract {
    
}
