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
    func getDetailRoom(nameRoom: String) -> Promise<DetailRoom>
    func putDetailRoom(room: String, detail: (String, String)) -> Promise<[String:Any]>
    func putAirDetailRoom(room: String, detail: (String, Int)) -> Promise<[String: Any]>
}

class RoomNetworkProvider: RoomProviderContract {
    
    enum RoomNetworkError: Error {
        case homePageLoadError, detailPageLoadError
    }
    
    func getRooms() -> Promise<[Room]> {
        return self.getHomePage()
    }
    
    func getDetailRoom(nameRoom: String) -> Promise<DetailRoom> {
        return self.getDetailPage(name: nameRoom)
    }
    
    func putDetailRoom(room: String, detail: (String, String)) -> Promise<[String:Any]> {
        return self.putDetail(room: room, detail: detail)
    }
    func putAirDetailRoom(room: String, detail: (String, Int)) -> Promise<[String: Any]> {
        return self.putAirDetail(room: room, detail: detail)
    }
    
    //MARK: PRIVATE
    
    private let kAPIResultsKey = "rooms"
    
    private func getUrlHome() -> URL {
        return URL(string: kAPIURL+kAPIResultsKey)!
    }
    
    private func getUrlDetail(roomName: String) -> URL {
        return URL(string: kAPIURL+roomName)!
    }
    private func getUrlRoom(name: String, detail: String) -> URL {
        return URL(string: kAPIURL+name+"/"+detail)!
    }
    
    
    private func getHomePage() -> Promise<[Room]> {
        return Promise<[Room]> { promise in
            let url = getUrlHome()
            AF.request(url).responseJSON { response in
                guard let data = try? response.result.get() as? [String: Any],
                      let dataResults = (data[self.kAPIResultsKey] as? [[String: Any]]) else {
                    promise.reject(RoomNetworkError.homePageLoadError)
                    return
                }
                var results: [Room] = []
                for item in dataResults{
                    if let room = try? Room(JSON: item){
                        results.append(room)
                    } else{
                        promise.reject(RoomNetworkError.homePageLoadError)
                    }
                }
                promise.fulfill(results)
            }
        }
    }
    
    private func getDetailPage(name: String) -> Promise<DetailRoom> {
        return Promise<DetailRoom> { promise in
            let nameLowercassed = name.lowercased()
            let url = getUrlDetail(roomName: nameLowercassed)
            AF.request(url).responseJSON { response in
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
    
    private func putDetail(room: String, detail: (String, String)) -> Promise<[String: Any]> {
        return Promise<[String: Any]> { promise in
            
            let parameter: [String: Any] = [detail.0: detail.1]
            let url = getUrlRoom(name: room, detail: detail.0)
            AF.request(url, method: .put, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                guard let data = try? response.result.get() as? [String: Any] else {
                    promise.reject(RoomNetworkError.detailPageLoadError)
                    return
                }
                
                promise.fulfill(data)
            }
        }
    }
    
    private func putAirDetail(room: String, detail: (String, Int)) -> Promise<[String: Any]> {
        return Promise<[String: Any]> { promise in
            
            let parameter: [String: Any] = ["power": detail.0, "temp": detail.1]
            let url = getUrlRoom(name: room, detail: "air")
            AF.request(url, method: .put, parameters: parameter, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                guard let data = try? response.result.get() as? [String: Any] else {
                    promise.reject(RoomNetworkError.detailPageLoadError)
                    return
                }
                
                promise.fulfill(data)
            }
        }
    }
}
