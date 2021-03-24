//
//  RoomListInteractor.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class RoomListInteractor: BaseInteractor, RoomListInteractorContract {
    weak var output: RoomListInteractorOutputContract!

    var networkProvider: RoomNetworkProvider
    
    init (provider: RoomNetworkProvider) {
        self.networkProvider = provider
    }
}
