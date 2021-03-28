//
//  MenuTabBarPresenter.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation

class MenuTabBarPresenter: BasePresenter, MenuTabBarPresenterContract {
    
    weak var view: MenuTabBarViewContract!
    var interactor: MenuTabBarInteractorContract!
    var entity: MenuTabBarEntityContract!
    var wireframe: MenuTabBarWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {

    }
    
    func getTabBarViewController() -> [BaseViewController] {
        let roomList = RoomListBuilder.build()
        let login = LoginBuilder.build()
        return [roomList, login]
    }
}


// MARK: - MenuTabBarInteractorOutputContract
extension MenuTabBarPresenter: MenuTabBarInteractorOutputContract {
    
}

// MARK: - MenuTabBarWireframeOutputContract
extension MenuTabBarPresenter: MenuTabBarWireframeOutputContract {
    
}
