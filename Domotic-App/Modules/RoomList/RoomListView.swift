//
//  RoomListView.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 23/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class RoomListView: BaseViewController, RoomListViewContract {
    var presenter: RoomListPresenterContract!

    @IBOutlet weak var roomsTable: UITableView!
    var datasource: RoomListDataSource!
    var delegate: RoomListDelegate!

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
    
    func updateData(rooms: [Room]) {
        datasource.rooms = rooms
        roomsTable.reloadData()
    }
    
    func feedbackError(error: Error) {
        assert(false, "not implemented")
    }

    private func setupView() {
        roomsTable.register(UINib(nibName: RoomCell.cellId, bundle: nil), forCellReuseIdentifier: RoomCell.cellId)
        
        datasource = RoomListDataSource()
        delegate = RoomListDelegate()
        delegate.presenter = presenter

        roomsTable.dataSource = datasource
        roomsTable.delegate = delegate
    }
}

class RoomListDataSource: NSObject, UITableViewDataSource {
    var rooms: [Room] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.cellId, for: indexPath) as! RoomCell
        
        cell.textLabel?.text = rooms[indexPath.row].name
        
        return cell
    }
}

class RoomListDelegate: NSObject, UITableViewDelegate {
    weak var presenter: RoomListPresenterContract!
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("select")
    }
}
