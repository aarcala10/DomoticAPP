//
//  RoomListPresenter.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class RoomListPresenter: BasePresenter, RoomListPresenterContract {

    weak var view: RoomListViewContract!
    var interactor: RoomListInteractorContract!
    var entity: RoomListEntityContract!
    var wireframe: RoomListWireframeContract!
    
    var roomsList : [Room] = []

    func viewDidLoad() {

    }

    func viewWillAppear() {
        firstly {
            interactor.getRoomsList()
        }.done { [weak self] roomsListData in
            
            self?.roomsList = roomsListData
            self?.view.updateData(rooms: roomsListData)
            
        }.catch{ error in
            self.view.feedbackError(error: error)
        }
    }
    
    func getTabBarTitle() -> String {
        return "Rooms"
    }
}


// MARK: - RoomListInteractorOutputContract
extension RoomListPresenter: RoomListInteractorOutputContract {
    
}

// MARK: - RoomListWireframeOutputContract
extension RoomListPresenter: RoomListWireframeOutputContract {
    
}
