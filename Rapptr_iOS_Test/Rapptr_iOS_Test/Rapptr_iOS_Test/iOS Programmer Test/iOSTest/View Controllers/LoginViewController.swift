//
//  LoginViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class LoginViewController: UIViewController {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Take email and password input from the user
     *
     * 3) Use the endpoint and paramters provided in LoginClient.m to perform the log in
     *
     * 4) Calculate how long the API call took in milliseconds
     *
     * 5) If the response is an error display the error in a UIAlertController
     *
     * 6) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertController
     *
     * 7) When login is successful, tapping 'OK' in the UIAlertController should bring you back to the main menu.
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Properties
    //private var client: LoginClient?
    private var validateTextFields: (email: String, password: String)? {
        guard let email = emailTextField.text, !email.isEmpty,
                    let password = passwordTextField.text, !password.isEmpty else {
            let alertTitle = "Required"
            let alertMessage = "Please fill in all fields"
            makeGeneralAlert(with: alertTitle, message: alertMessage)
            return nil
        }
        return (email, password)
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        configureTextFields()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        
//        guard let _ = validateTextFields else { return }
//
//        guard let email = emailTextField.text,
//              let password = emailTextField.text
//        else { return }
        
        LoginClient.shared.login(with: "info@rapptrlabs.com", password: "Test123") { result in
            switch result {
            case .success:
                print("Success")
            case .failure:
                print("Failure")
            }
        }
    }
    
    // MARK: Private Methods
    
    //add success alert
    
    private func makeGeneralAlert(with title: String, message: String) {
      let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(alertVC, animated: true, completion: nil)
    }
    
    private func configureTextFields() {
        let emailTextFieldHeight = self.emailTextField.frame.height
        let emailPaddingView = UIView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: 24,
                                                    height: emailTextFieldHeight))
        emailTextField.leftView = emailPaddingView
        emailTextField.leftViewMode = UITextField.ViewMode.always
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor.getTextFieldPlaceholderColor()])
   
        
        let passwordTextFieldHeight = self.passwordTextField.frame.height
        let passwordPaddingView =  UIView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: 24,
                                                        height: passwordTextFieldHeight))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor.getTextFieldPlaceholderColor()])
    }
}
