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
    var roomSelected: String
    
    init (provider: RoomProviderContract, roomSelected: String) {
        self.roomProvider = provider
        self.roomSelected = roomSelected
    }
    
    func getDetailsRoom() -> Promise<DetailRoom> {
        return Promise<DetailRoom> { promise in
            firstly {
                self.roomProvider.getDetailRoom(nameRoom: roomSelected)
            }.done { details in
                promise.fulfill(details)
            }.cauterize()
        }
    }
    func getNameRoom() -> String {
        return roomSelected
    }
    
    func putDetail(room: String, detail: (String, String)) -> Promise<[String:Any]> {
        return Promise<[String:Any]> { promise in
            firstly{
                self.roomProvider.putDetailRoom(room: room, detail: detail)
            }.done { detail in
                promise.fulfill(detail)
            }.cauterize()
        }
    }
    
    func putAirDetail(room: String, detail: (String, Int)) -> Promise<[String:Any]> {
        return Promise<[String:Any]> { promise in
            firstly{
                self.roomProvider.putAirDetailRoom(room: room, detail: detail)
            }.done { detail in
                promise.fulfill(detail)
            }.cauterize()
        }
    }
    
}
