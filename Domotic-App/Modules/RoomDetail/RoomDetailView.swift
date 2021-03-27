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
    
    @IBOutlet weak var ligthtContentView: UIView!
    @IBOutlet weak var blindsContentView: UIView!
    @IBOutlet weak var doorContentView: UIView!
    @IBOutlet weak var airContentView: UIView!
    
    @IBOutlet weak var lightView: UIView!
    @IBOutlet weak var blindsView: UIView!
    @IBOutlet weak var doorView: UIView!
    @IBOutlet weak var airView: UIView!
    
    @IBOutlet weak var switchLight: UISwitch!
    @IBOutlet weak var switchBlinds: UISwitch!
    @IBOutlet weak var switchDoor: UISwitch!
    @IBOutlet weak var switchAir: UISwitch!
    @IBOutlet weak var tempPicker: UIPickerView!
    
    var details: DetailRoom?
    var pickerData = Array(0...35)
    
    
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
    
    func updateDetailsData(details: DetailRoom) {
        self.details = details
        self.title = self.presenter.getNameRoom().uppercased()
        setupData()
    }
    
    func feedbackError(error: Error) {
        assert(false, "not implemented")
    }
    
    private func setupView() {
        tempPicker.delegate = self
        tempPicker.dataSource = self
        lightView.setContentViewDesign()
        blindsView.setContentViewDesign()
        doorView.setContentViewDesign()
        airView.setContentViewDesign()
    }
    
    private func setupData() {
        if details?.light != nil{
            setSwitchLight()
            ligthtContentView.isHidden = false
        }
        if details?.blinds != nil{
            setSwitchBlinds()
            blindsContentView.isHidden = false
        }
        if details?.door != nil{
            setSwitchDoor()
            doorContentView.isHidden = false
        }
        if details?.air.power != nil {
            setSwitchAir()
            airContentView.isHidden = false
        }
    }
    
    private func setSwitchLight() {
        
        if self.details?.light == "on" {
            switchLight.setOn(true, animated: true)
        } else {switchLight.setOn(false, animated: false)}
    }
    
    private func setSwitchBlinds() {
        if self.details?.blinds == "open" {
            switchBlinds.setOn(true, animated: true)
        } else {switchBlinds.setOn(false, animated: false)}
    }
    
    private func setSwitchDoor() {
        if self.details?.light == "open" {
            switchDoor.setOn(true, animated: true)
        } else {switchDoor.setOn(false, animated: false)}
    }
    
    private func setSwitchAir() {

        if let temp = self.details?.air.temp{
            tempPicker.selectRow(temp, inComponent: 0, animated: false)
            
            if self.details?.air.power == "on" {
                switchAir.setOn(true, animated: false)
            } else {
                switchAir.setOn(false, animated: false)
            }
        }
    }
    
    private func putDetail(room: String, detail: (String, String)) {
        presenter.putDetail(room: room, detail: detail)
    }
    
    private func putAirDetail(room: String, detail: (String, Int)) {
        presenter.putAirDetail(room: room, detail: detail)
    }
    
    
    @IBAction func lightSwitchAction(_ sender: UISwitch) {
        if (sender.isOn == true){
            putDetail(room: self.title!.lowercased(), detail: ("light", "on"))
        }else {
            putDetail(room: self.title!.lowercased(), detail: ("light", "off"))
        }
    }
    @IBAction func blindsSwitchAction(_ sender: UISwitch) {
        if (sender.isOn == true){
            putDetail(room: self.title!.lowercased(), detail: ("blinds", "open"))
        }else {
            putDetail(room: self.title!.lowercased(), detail: ("blinds", "close"))
        }
    }
    @IBAction func doorSwitchAction(_ sender: UISwitch) {
        if (sender.isOn == true){
            putDetail(room: self.title!.lowercased(), detail: ("door", "open"))
        }else {
            putDetail(room: self.title!.lowercased(), detail: ("door", "close"))
        }
    }
    
    @IBAction func airSwitchAction(_ sender: UISwitch) {
        let temp = tempPicker.selectedRow(inComponent: 0)
        if (sender.isOn == true){
            putAirDetail(room: self.title!.lowercased(), detail: ("on", temp))
        }else {
            putAirDetail(room: self.title!.lowercased(), detail: ("off", temp))
        }
    }
}


extension RoomDetailView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
}

extension RoomDetailView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return pickerData[row].description
    }
    
}
