//
//  NoteView.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 28/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class NoteView: BaseViewController, NoteViewContract {

	var presenter: NotePresenterContract!
    weak var activeInput: UITextField?
    
    @IBOutlet weak var noteTextField: UITextField!
    @IBOutlet weak var sendNoteBtn: UIButton!
    @IBOutlet weak var noteErrorLabel: UILabel!
    
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
        sendNoteBtn.layer.cornerRadius = 8
        noteTextField.delegate = self

    }
    
    private func sendNoteBtnTapped() {
        if validateNoteTextField() {
            noteTextField.rightView?.isHidden = true
            let note = Note(
                note: noteTextField.text!
                )
            self.presenter.sendNote(note: note)
            noteTextField.text = ""
            noteErrorLabel.text = ""
        }
    }
    
    @IBAction func sendNoteBtnTap(_ sender: Any) {
        sendNoteBtnTapped()
    }
    
    func showAlertPopUp(message: String) {
        showAlert(message, "", "OK")
    }
    
    func feedbackError(error: Error) {
        showAlert(error.localizedDescription, "Atention", "OK")
    }
}

extension NoteView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeInput = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeInput = textField
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.becomeFirstResponder()
    }
    
    func validateNoteTextField() -> Bool {
        if noteTextField.isNoteValid(note: noteTextField.text ?? "") {
            return true
        } else {
            noteTextField.showInvalidate()
            noteErrorLabel.text = "Can't be empty"
            return false
        }
        
    }
}
