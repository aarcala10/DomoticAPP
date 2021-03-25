//
//  RoomDetailInteractor.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class RoomDetailInteractor: BaseInteractor, RoomDetailInteractorContract {
    weak var output: RoomDetailInteractorOutputContract!

    var roomProvider: RoomProviderContract
    
    init (provider: RoomProviderContract) {
        self.roomProvider = provider
    }
    
    func getDetailRoom(nameRoom: String) -> Promise<DetailRoom> {
        return Promise<DetailRoom> { promise in
            firstly {
                self.roomProvider.getDetailRoom(nameRoom: nameRoom)
            }.done { details in
                promise.fulfill(details)
            }.cauterize()
        }
    }
}
