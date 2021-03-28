//
//  LocalAuthenticationProvider.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 28/3/21.
//

import Foundation
import LocalAuthentication
import PromiseKit

protocol LocalAuthenticationProviderContract {
    func biometricAuthEnable() -> Promise<Bool>
    func launchBiometricAuthentication() -> Promise<Bool>
    /// This mehotd only has meaningfull value after biometricAuthEnable has been call.
    func biometricIsFaceID() -> Bool
}

class LocalAuthenticationProvider: LocalAuthenticationProviderContract {
    var context: LAContext!

    init() {
        context = LAContext()
        context.localizedCancelTitle = "Introduce username & password"
    }

    func biometricAuthEnable() -> Promise<Bool> {
        return Promise<Bool> { promise in
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                promise.fulfill(true)
            } else {
                promise.fulfill(false)
            }
        }
    }

    func launchBiometricAuthentication() -> Promise<Bool> {
        return Promise<Bool> { promise in
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                   localizedReason: "Login") { success, error in
                promise.fulfill(success)
            }
        }
    }

    func biometricIsFaceID() -> Bool {
        return context.biometryType == .faceID
    }
}

