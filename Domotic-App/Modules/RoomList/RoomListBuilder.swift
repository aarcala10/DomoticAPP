//
//  RoomListBuilder.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class RoomListBuilder {

    static func build() -> RoomListView {
        let view = RoomListView.init(nibName: String(describing: RoomListView.self), bundle: nil)
        view.tabBarItem = UITabBarItem(title: "Rooms", image: UIImage(systemName: "square.grid.2x2.fill"), tag: 0)
        
        let presenter = RoomListPresenter()
        let entity = RoomListEntity()
        let wireframe = RoomListWireframe()
        
        let provider = RoomNetworkProvider()
        let interactor = RoomListInteractor(provider: provider)
        
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
