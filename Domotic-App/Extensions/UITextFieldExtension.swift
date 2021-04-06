//
//  UITextFieldExtension.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//

import UIKit

extension UITextField {

    func isUserValid(user: String) -> Bool {
        let userRegEx = "^\\w{6,18}$"
        let trimmedString = user.trimmingCharacters(in: .whitespaces)
        let validateUser = NSPredicate(format: "SELF MATCHES %@", userRegEx)
        let isvalidateUser = validateUser.evaluate(with: trimmedString)
        return isvalidateUser
     }
    
    func isPasswordValid(password: String) -> Bool {
          let passRegEx = "^\\w{6,18}$"
          let trimmedString = password.trimmingCharacters(in: .whitespaces)
          let validatePassword = NSPredicate(format: "SELF MATCHES %@", passRegEx)
          let isvalidatePass = validatePassword.evaluate(with: trimmedString)
          return isvalidatePass
       }
    
    func isConfirmPasswordValidate(textPassword: String, textConfirmPassword: String ) -> Bool {
        let equal: Bool = (textPassword == textConfirmPassword)
        return equal
    }
    
    func isEmailValidate(email: String) -> Bool {
          let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
          let trimmedString = email.trimmingCharacters(in: .whitespaces)
          let validateEmail = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
          let isValidateEmail = validateEmail.evaluate(with: trimmedString)
          return isValidateEmail
    }
    
    func isNoteValid(note: String) -> Bool {
        if note != ""{
            return true
        }
        return false
     }
    
    func showInvalidate() {
        self.text = ""
        self.rightView = UIImageView(image: UIImage(systemName: "exclamationmark.circle"))
        self.rightView?.tintColor = UIColor.red
        self.rightViewMode = .unlessEditing
    }

}
