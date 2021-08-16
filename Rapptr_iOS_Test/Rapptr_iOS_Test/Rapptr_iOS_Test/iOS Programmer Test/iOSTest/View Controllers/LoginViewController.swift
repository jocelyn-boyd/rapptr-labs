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
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: Any) {
        
        guard let _ = validateTextFields else { return }
        
        guard let email = emailTextField.text,      //info@rapptrlabs.com
              let password = passwordTextField.text    //Test123
        else { return }
        
        guard email == "info@rapptrlabs.com", password == "Test123" else {
            print(email,password)
            displayErrorAlert()
            return
        }
        
        let startTime = Date()
        
        LoginClient.shared.login(with: email, password: password) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success:
                    let executionTime = self?.calculateExcutionTime(startTime: startTime)
                    self?.displaySuccessAlert(executionTime: executionTime!)
                case let .failure(error):
                    self?.displayErrorAlert()
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // MARK: Private Methods
    func calculateExcutionTime(startTime: Date) -> Double {
        let executionTime = Date().timeIntervalSince(startTime)
        let apiCallExecutionTime = executionTime*1000
        return apiCallExecutionTime
    }
    
    private func displaySuccessAlert(executionTime: Double) {
        let formatedExecutionTime = String(format: "%.f", executionTime)
        let title = "Success"
        let message = "Login Successful! API call took about \(formatedExecutionTime) milliseconds"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
    private func displayErrorAlert() {
        let title = "Error"
        let message = "Incorrect Email or Password"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alert, animated: true)
    }
    
    
    private func makeGeneralAlert(with title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
    
    private func configureTextFields() {
        emailTextField.setLeftPaddingInset(24)
        passwordTextField.setLeftPaddingInset(24)
    }
}
