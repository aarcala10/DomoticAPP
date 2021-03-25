//
//  RoomListInteractor.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class RoomListInteractor: BaseInteractor, RoomListInteractorContract {
    weak var output: RoomListInteractorOutputContract!
    
    var roomProvider: RoomProviderContract
    
    init (provider: RoomProviderContract) {
        self.roomProvider = provider
    }
    
    func getRoomsList() -> Promise<[Room]> {
        return Promise<[Room]> { promise in
            firstly {
                self.roomProvider.getRooms()
            }.done { room in
                let roomList = room.map {$0}
                
                promise.fulfill(roomList)
            }.cauterize()
            
        }
    }
}
