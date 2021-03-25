//
//  RoomDetailPresenter.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class RoomDetailPresenter: BasePresenter, RoomDetailPresenterContract {

    weak var view: RoomDetailViewContract!
    var interactor: RoomDetailInteractorContract!
    var entity: RoomDetailEntityContract!
    var wireframe: RoomDetailWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {

    }
}


// MARK: - RoomDetailInteractorOutputContract
extension RoomDetailPresenter: RoomDetailInteractorOutputContract {
    
}

// MARK: - RoomDetailWireframeOutputContract
extension RoomDetailPresenter: RoomDetailWireframeOutputContract {
    
}
