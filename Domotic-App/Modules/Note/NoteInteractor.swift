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
    
    enum LoginError: Error {
        case biometricDisable, loginFail
    }
    
    weak var output: NoteInteractorOutputContract!

    var noteProvider: NoteProviderContract
    var laProvider: LocalAuthenticationProviderContract
    
    init (provider: NoteProviderContract, laProvider: LocalAuthenticationProviderContract) {
        self.noteProvider = provider
        self.laProvider = laProvider
    }
    
    func sendNote(note: Note) -> Promise<Bool> {
        return Promise<Bool> { promise in
            firstly {
                laProvider.biometricAuthEnable()
            }.done { isEnable in
                if isEnable {
                    self.laProvider.launchBiometricAuthentication().done { success in
                        if success {
                            // swiftlint:disable:next redundant_discardable_let
                            let _ = self.sendNoteAPI(note: note).done { result in
                                promise.fulfill(result)
                            }
                        } else {
                            throw LoginError.loginFail
                        }
                    }.catch { _ in
                        promise.fulfill(false)
                    }
                } else {
                    throw LoginError.biometricDisable
                }
            }.catch { _ in
                promise.fulfill(false)
            }
        }
    }
    
    private func sendNoteAPI(note: Note) -> Promise<Bool> {
        return Promise<Bool> { promise in
            firstly {
                self.noteProvider.putNote(note: note)
            }.done { result in
                promise.fulfill(result)
            }.cauterize()
        }
    }
}
