//
//  NoteNetworkProvider.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 28/3/21.
//

import Foundation
import PromiseKit
import Alamofire

protocol NoteProviderContract {
    func putNote(note: Note) -> Promise<Bool>
}

class NoteNetworkProvider: NoteProviderContract {
    
    enum NoteNetworkError: Error {
        case notePutError
    }
    
    func putNote(note: Note) -> Promise<Bool> {
        return self.putNoteWeb(note: note)
    }
    
    private let kAPIResultsKey = "note"
    
    private func getUrlNote() -> URL {
        return URL(string: kAPIURL+kAPIResultsKey)!
    }
    
    private func putNoteWeb(note: Note) -> Promise<Bool> {
        return Promise<Bool> { promise in
            
            let parameter: [String: String] = [kAPIResultsKey: note.note]
            let url = getUrlNote()
            AF.request(
                url, method: .put,
                parameters: parameter,
                encoding: JSONEncoding.default,
                headers: nil).responseJSON { response in
                    // swiftlint:disable:next unused_optional_binding
                    guard let _ = try? response.result.get() as? [String: String] else {
                        promise.reject(NoteNetworkError.notePutError)
                        return
                    }
                    
                    promise.fulfill(true)
                }
        }
    }
    
}
