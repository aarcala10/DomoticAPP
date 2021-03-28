//
//  UIViewControllerExtension.swift
//  VIPER
//
//  Created by Manuel Alfonso Terol on 04/11/2020.
//
import UIKit

extension UIViewController {
    
    /// Get top View Controller
    ///
    /// - Returns: top view controller if exist
    static func topViewController() -> UIViewController? {
        
        if var topController = UIApplication.shared.windows.first(where: \.isKeyWindow)?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        
        return nil
    }
    
    /// Muestra un alertcontroller con una única acción
    /// - Parameters:
    ///   - alertMessage: Mensaje del alert
    ///   - alertTitle: Título del alert
    ///   - alertActionTitle: Título de la acción
    func showAlert(_ alertMessage: String,
                               _ alertTitle: String = "Error",
                               _ alertActionTitle: String = "OK") {

        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: alertActionTitle, style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
    
}
