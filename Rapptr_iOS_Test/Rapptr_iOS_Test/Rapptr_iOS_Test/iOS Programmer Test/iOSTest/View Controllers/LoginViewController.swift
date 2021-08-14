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
    
    // MARK: - Properties
    private var client: LoginClient?
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
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
    }
    
    //MARK: Configuration Methods
    private func configureTextFields() {
        let emailTextFieldHeight = self.emailTextField.frame.height
        let emailPaddingView = UIView(frame: CGRect(x: 0,
                                                    y: 0,
                                                    width: 24,
                                                    height: emailTextFieldHeight))
        emailTextField.leftView = emailPaddingView
        emailTextField.leftViewMode = UITextField.ViewMode.always
        emailTextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [.foregroundColor: UIColor.getCustomPlaceholderColor()])
        
        let passwordTextFieldHeight = self.passwordTextField.frame.height
        let passwordPaddingView =  UIView(frame: CGRect(x: 0,
                                                        y: 0,
                                                        width: 24,
                                                        height: passwordTextFieldHeight))
        passwordTextField.leftView = passwordPaddingView
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        passwordTextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [.foregroundColor: UIColor.getCustomPlaceholderColor()])
    }
}
