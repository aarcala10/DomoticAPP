//
//  NotePresenter.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 28/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class NotePresenter: BasePresenter, NotePresenterContract {

    weak var view: NoteViewContract!
    var interactor: NoteInteractorContract!
    var entity: NoteEntityContract!
    var wireframe: NoteWireframeContract!

    func viewDidLoad() {

    }

    func viewWillAppear() {

    }
    
    func sendNote(note: Note) {
        firstly {
            interactor.sendNote(note: note)
        }.done { [weak self] loged in
            if loged {
                self?.view.showAlertPopUp(message: "Note was sended!!")
            }else {self?.view.showAlertPopUp(message: "An error has occurred")}
        }.catch { error in
            self.view.feedbackError(error: error)
        }
    }
}


// MARK: - NoteInteractorOutputContract
extension NotePresenter: NoteInteractorOutputContract {
    
}

// MARK: - NoteWireframeOutputContract
extension NotePresenter: NoteWireframeOutputContract {
    
}
