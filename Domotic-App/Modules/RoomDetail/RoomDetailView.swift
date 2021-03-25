//
//  RoomDetailView.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 25/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class RoomDetailView: BaseViewController, RoomDetailViewContract {

	var presenter: RoomDetailPresenterContract!

	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }

    private func setupView() {

    }
}
