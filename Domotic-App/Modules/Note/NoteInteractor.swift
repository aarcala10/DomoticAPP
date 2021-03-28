//
//  NoteInteractor.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 28/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import Foundation
import PromiseKit

class NoteInteractor: BaseInteractor, NoteInteractorContract {
    
    weak var output: NoteInteractorOutputContract!

    var noteProvider: NoteProviderContract
    
    init (provider: NoteNetworkProvider) {
        self.noteProvider = provider
    }
    
    func sendNote(note: Note) -> Promise<Bool> {
        return Promise<Bool> { promise in
            firstly {
                self.noteProvider.putNote(note: note)
            }.done{ result in
                promise.fulfill(result)
            }.cauterize()
        }
    }
}
