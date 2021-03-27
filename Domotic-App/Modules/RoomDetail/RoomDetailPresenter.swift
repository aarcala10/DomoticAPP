//
//  RoomDetailPresenter.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class RoomDetailPresenter: BasePresenter, RoomDetailPresenterContract {

    weak var view: RoomDetailViewContract!
    var interactor: RoomDetailInteractorContract!
    var entity: RoomDetailEntityContract!
    var wireframe: RoomDetailWireframeContract!
    
    var details: DetailRoom?

    func viewDidLoad() {

    }

    func viewWillAppear() {
        firstly {
            interactor.getDetailsRoom()
        }.done { [weak self] detailData in
            self?.details = detailData
            self?.view.updateDetailsData(details: detailData)
        }.catch { error in
            self.view.feedbackError(error: error)
        }

    }
    func getNameRoom() -> String {
        return interactor.getNameRoom()
    }
    func putDetail(room: String, detail: (String, String)) {
        firstly {
            interactor.putDetail(room: room, detail: detail)
        }.catch { error in
            self.view.feedbackError(error: error)
        }
    }
    
    func putAirDetail(room: String, detail: (String, Int)) {
        firstly {
            interactor.putAirDetail(room: room, detail: detail)
        }.catch { error in
            self.view.feedbackError(error: error)
        }
    }
    
    
}

// MARK: - RoomDetailInteractorOutputContract
extension RoomDetailPresenter: RoomDetailInteractorOutputContract {
    
}

// MARK: - RoomDetailWireframeOutputContract
extension RoomDetailPresenter: RoomDetailWireframeOutputContract {
    
}
