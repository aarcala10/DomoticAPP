//
//  RoomDetailBuilder.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class RoomDetailBuilder {

    static func build() -> RoomDetailView {
        let view = RoomDetailView.init(nibName: String(describing: RoomDetailView.self), bundle: nil)
        
        let presenter = RoomDetailPresenter()
        let entity = RoomDetailEntity()
        let wireframe = RoomDetailWireframe()
        
        let provider = RoomNetworkProvider()
        let interactor = RoomDetailInteractor(provider: provider)
        
        view.presenter = presenter
        view.presenter.view = view
        view.presenter.entity = entity
        view.presenter.interactor = interactor
        view.presenter.interactor.output = presenter
        view.presenter.wireframe = wireframe
        
        view.presenter.wireframe.output = presenter
        view.presenter.wireframe.view = view
        
        return view
    }
}
