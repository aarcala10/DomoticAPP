//
//  NoteBuilder.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 28/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NoteBuilder {

    static func build() -> NoteView {
        let view = NoteView.init(nibName: String(describing: NoteView.self), bundle: nil)
        view.tabBarItem = UITabBarItem(title: "Note", image: UIImage(systemName: "paperplane.fill"), tag: 0)
        let presenter = NotePresenter()
        let entity = NoteEntity()
        let wireframe = NoteWireframe()
        
        let provider = NoteNetworkProvider()
        let laProvider = LocalAuthenticationProvider()
        let interactor = NoteInteractor(provider: provider, laProvider: laProvider)
        
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
