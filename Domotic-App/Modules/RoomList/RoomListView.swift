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
    var rooms: [Room] = []

	// MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTable()
        self.presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.presenter.viewWillAppear()
    }
    
    func updateData(rooms: [Room]) {
        self.rooms = rooms
        roomsTable.reloadData()
    }
    func showAlertPopUp(message: String) {
        showAlert(message, "Atention", "OK")
    }
    
    func feedbackError(error: Error) {
        showAlertPopUp(message: error.localizedDescription)
    }

    private func setupTable() {
        roomsTable.register(UINib(nibName: RoomCell.cellId, bundle: nil), forCellReuseIdentifier: RoomCell.cellId)

        roomsTable.dataSource = self
        roomsTable.delegate = self
    }
}

extension RoomListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RoomCell.cellId, for: indexPath) as! RoomCell
        
        cell.setUpData(room: rooms[indexPath.item])
        
        return cell
    }
}

extension RoomListView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectRoomCell(name: rooms[indexPath.row].name)

        tableView.deselectRow(at: indexPath, animated: true)
    }
}
