//
//  NoteContract.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 28/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import UIKit
import PromiseKit

protocol NoteEntityContract: BaseEntity {
    
}

protocol NoteViewContract: BaseViewController {
    var presenter: NotePresenterContract! { get set }
    
    func feedbackError(error: Error)
    func showAlertPopUp(message: String)
    
    
}

protocol NotePresenterContract: BasePresenter {
    var view: NoteViewContract! { get set }
    var interactor: NoteInteractorContract! { get set }
    var entity: NoteEntityContract! { get set }
    var wireframe: NoteWireframeContract! { get set }

    func viewDidLoad()
    func viewWillAppear()
    
    func sendNote(note: Note)
}

protocol NoteInteractorContract: BaseInteractor {
    var output: NoteInteractorOutputContract! {get set}
    
    func sendNote(note: Note) -> Promise<Bool>
}

protocol NoteInteractorOutputContract: class {
    
}

protocol NoteWireframeContract: BaseWireframe {
    var output: NoteWireframeOutputContract! { get set }
    var view: UIViewController! { get set }
    
    func showBasicLoading(text: String)
    func hideBasicLoading(completion: @escaping (() -> Void))
}

protocol NoteWireframeOutputContract: class {

}
