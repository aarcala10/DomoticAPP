//
//  LoginView.swift
//  Domotic-App
//
//  Created by Adrian Arcalá Ocón on 27/3/21.
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//

import UIKit

class LoginView: BaseViewController, LoginViewContract {
    
    var presenter: LoginPresenterContract!
    weak var activeInput: UITextField?
    
    @IBOutlet weak var loginViewContent: UIView!
    @IBOutlet weak var signupViewContent: UIView!
    
    //MARK: LOGIN
    @IBOutlet weak var userLoginField: UITextField!
    @IBOutlet weak var userloginLabel: UILabel!
    @IBOutlet weak var passwordLoginField: UITextField!
    @IBOutlet weak var passwordLoginLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var sigupBtnViewer: UIButton!
    
    //MARK: SIGNUP
    @IBOutlet weak var userSignupField: UITextField!
    @IBOutlet weak var userSignUpLabel: UILabel!
    @IBOutlet weak var emailSignupField: UITextField!
    @IBOutlet weak var emailSignUpLabel: UILabel!
    @IBOutlet weak var passwordSignupField: UITextField!
    @IBOutlet weak var passwordSignUpLabel: UILabel!
    @IBOutlet weak var confPasswordSignupField: UITextField!
    @IBOutlet weak var confPasswordSignUpLabel: UILabel!
    @IBOutlet weak var signupBtn: UIButton!
    @IBOutlet weak var loginBtnViewer: UIButton!
    
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
        loginBtn.layer.cornerRadius = 8
        signupBtn.layer.cornerRadius = 8
        
        loginViewContent.isHidden = false
        signupViewContent.isHidden = true
        
        userLoginField.delegate = self
        passwordLoginField.delegate = self
        
        userSignupField.delegate = self
        emailSignupField.delegate = self
        passwordSignupField.delegate = self
        confPasswordSignupField.delegate = self
        
    }
    
    private func setView(login: Bool){
        loginViewContent.isHidden = !login
        signupViewContent.isHidden = login
        
    }
    
    private func logIn(){
        if validateTextFieldLogIn(){
            let login = Login(
                username: userLoginField.text!,
                password: passwordLoginField.text!
            )
            self.presenter.login(login: login)
            clearInputs()
        }
        
    }
    
    private func signUp(){
        if validateTextFieldSigUp(){
            let signup = Signup(
                username: userSignupField.text!,
                password: passwordSignupField.text!,
                email: emailSignupField.text!
            )
            self.presenter.signup(signup: signup)
            clearInputs()
        }
    }
    
    func clearInputs(){
        userLoginField.text?.removeAll()
        userLoginField.rightView?.isHidden = true
        passwordLoginField.text?.removeAll()
        passwordLoginField.rightView?.isHidden = true
        userSignupField.text?.removeAll()
        userSignupField.rightView?.isHidden = true
        passwordSignupField.text?.removeAll()
        passwordSignupField.rightView?.isHidden = true
        confPasswordSignupField.text?.removeAll()
        confPasswordSignupField.rightView?.isHidden = true
        emailSignupField.text?.removeAll()
        emailSignupField.rightView?.isHidden = true
        
    }
    
    @IBAction func pushSignupViewer(_ sender: Any) {
        setView(login: false)
    }
    @IBAction func pushLoginViewer(_ sender: Any) {
        setView(login: true)
    }
    @IBAction func loginBtnTap(_ sender: Any) {
        logIn()
    }
    @IBAction func signupBtnTap(_ sender: Any) {
        signUp()
    }
    
    func showAlertPopUp(message: String) {
        showAlert(message, "","OK")
    }
    
    func feedbackError(error: Error) {
        showAlert(error.localizedDescription, "Atention", "OK")
    }
    
}

extension LoginView: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeInput = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeInput = textField
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case userSignupField:
            let _ = emailSignupField.becomeFirstResponder()
        case emailSignupField:
            let _ =  passwordSignupField.becomeFirstResponder()
        case passwordSignupField:
            let _ = confPasswordSignupField.becomeFirstResponder()
        case confPasswordSignupField:
            textFieldDidEndEditing(confPasswordSignupField)
            signUp()
        case userLoginField:
            let _ = passwordLoginField.becomeFirstResponder()
        default:
            textFieldDidEndEditing(passwordLoginField)
            logIn()
        }
        
        return true
    }
    
    func validateTextFieldSigUp() -> Bool {
        
        if  userSignupField.isUserValid(user: userSignupField.text ?? "") {
            userSignUpLabel.text = ""
            if emailSignupField.isEmailValidate(email: emailSignupField.text ?? ""){
                emailSignUpLabel.text = ""
                if passwordSignupField.isPasswordValid(password: passwordSignupField.text ?? ""){
                    passwordSignUpLabel.text = ""
                    if confPasswordSignupField.isConfirmPasswordValidate(textPassword: passwordSignupField.text ?? "", textConfirmPassword: confPasswordSignupField.text ?? "") {
                        confPasswordSignUpLabel.text = ""
                        return true
                    }else {
                        confPasswordSignupField.showInvalidate()
                        confPasswordSignUpLabel.text = "The passwords aren't the same"
                        return false
                    }
                } else {
                    passwordSignupField.showInvalidate()
                    passwordSignUpLabel.text = "Min. 6 characters"
                    return false
                }
            }else {
                emailSignupField.showInvalidate()
                emailSignUpLabel.text = "Email format is incorrect"
                return false
            }
        }else {
            userSignupField.showInvalidate()
            userSignUpLabel.text = "Min. 6 characters"
            return false
        }
    }
    
    func validateTextFieldLogIn() -> Bool {
        
        if  userLoginField.isUserValid(user: userLoginField.text ?? "") {
            userloginLabel.text = ""
            if passwordLoginField.isPasswordValid(password: passwordLoginField.text ?? ""){
                passwordLoginLabel.text = ""
                return true
            } else {
                passwordLoginField.showInvalidate()
                passwordLoginLabel.text = "Min. 6 characters"
                return false
            }
        }else {
            userLoginField.showInvalidate()
            userloginLabel.text = "Min. 6 characters"
            return false
        }
    }
}
