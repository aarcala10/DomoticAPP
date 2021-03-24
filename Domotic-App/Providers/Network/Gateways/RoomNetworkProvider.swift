//
//  RoomNetworkProvider.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//

import Foundation
import PromiseKit

protocol RoomNetworkContract{
    func getRooms() -> Promise<[Room]>
}

class RoomNetworkProvider: BaseNetworkProvider {
    
    enum RoomNetworkError: Error {
        case homePageLoadError, detailPageLoadError
    }
    
    enum RoomURLEntries {
        case kHomePage
        case kDetailRoom(String)
    }
    
    //MARK: Apunte
    /* En este caso coincide el nombre del String en el JSON recibido con el String que completa la URL por eso uso kAPIResultsKey en el get url */
    let kAPIResultsKey = "rooms"
    let kAPIIdKey = "id"
    
    
    private func getUrl(service: RoomURLEntries) -> URL {
        switch service {
        case .kHomePage:
            return URL(string: kAPIURL+kAPIResultsKey)!
        case .kDetailRoom(let roomId):
            return URL(string: kAPIURL+String(roomId))!
        }
    }
    
    private func getHomePage() -> Promise<[Room]> {
        return Promise<[Room]> { promise in
            sessionManager.request(getUrl(service: .kHomePage)).responseJSON { response in
                guard let data = try? response.result.get() as? [String: Any],
                      let dataResults = data[self.kAPIResultsKey] as? [Room] else {
                    promise.reject(RoomNetworkError.homePageLoadError)
                    return
                }

                promise.fulfill(dataResults)
            }
        }
    }
    
    private func getDetailPage(name: String) -> Promise<DetailRoom> {
        return Promise<DetailRoom> { promise in
            sessionManager.request(getUrl(service: .kDetailRoom(name))).responseJSON { response in
                guard let data = try? response.result.get() as? [String: Any] else {
                    promise.reject(RoomNetworkError.detailPageLoadError)
                    return
                }
                
                if let detailRoom = try? DetailRoom(JSON: data) {
                    promise.fulfill(detailRoom)
                } else{
                    promise.reject(RoomNetworkError.detailPageLoadError)
                }
            }
        }
    }

}
