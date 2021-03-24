//
//  RoomNetworkProvider.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//

import Foundation
import Alamofire
import PromiseKit

protocol RoomProviderContract{
    func getRooms() -> Promise<[Room]>
}

class RoomNetworkProvider: RoomProviderContract {
    
    enum RoomNetworkError: Error {
        case homePageLoadError, detailPageLoadError
    }
    
    enum RoomURLEntries {
        case kHomePage
        case kDetailRoom(String)
    }
    
    //MARK: NOTE
    /* En este caso coincide el nombre del String en el JSON recibido con el String que completa la URL por eso uso kAPIResultsKey en el getUrl */
    let kAPIResultsKey = "rooms"
    
    func getRooms() -> Promise<[Room]> {
        return self.getHomePage()
    }
    
    private func getUrl(service: RoomURLEntries) -> URL {
        print(kAPIURL+kAPIResultsKey)
        return URL(string: kAPIURL+kAPIResultsKey)!
    }
    
    private func getHomePage() -> Promise<[Room]> {
        return Promise<[Room]> { promise in
            AF.request(getUrl(service: .kHomePage)).responseJSON { response in
                guard let data = try? response.result.get() as? [String: Any],
                      let dataResults = (data[self.kAPIResultsKey] as? [[String: Any]]) else {
                    promise.reject(RoomNetworkError.homePageLoadError)
                    return
                }
                var results: [Room] = []
                for item in dataResults{
                    if let room = try? Room(JSON: item){
                        results.append(room)
                    }
                }
                
                promise.fulfill(results)
            }
        }
    }
    
//    private func getDetailPage(name: String) -> Promise<DetailRoom> {
//        return Promise<DetailRoom> { promise in
//            sessionManager.request(getUrl(service: .kDetailRoom(name))).responseJSON { response in
//                guard let data = try? response.result.get() as? [String: Any] else {
//                    promise.reject(RoomNetworkError.detailPageLoadError)
//                    return
//                }
//
//                if let detailRoom = try? DetailRoom(JSON: data) {
//                    promise.fulfill(detailRoom)
//                } else{
//                    promise.reject(RoomNetworkError.detailPageLoadError)
//                }
//            }
//        }
//    }

}
