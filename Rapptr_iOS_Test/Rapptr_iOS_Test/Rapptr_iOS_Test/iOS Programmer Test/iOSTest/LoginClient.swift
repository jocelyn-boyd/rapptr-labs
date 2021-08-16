//
//  LoginClient.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/14/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

//* =========================================================================================
//* INSTRUCTIONS
//* =========================================================================================
//* 1) Make a request here to login.
//*
//* 2) Using the following endpoint, make a request to login
//*    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
//*
//* 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
//*
//* 4) email - info@rapptrlabs.com
//*   password - Test123
//**/

import Foundation

class LoginClient {
    
    static let shared = LoginClient()
    
    func login(with email: String, password: String, completionHandler: @escaping (Result<Bool,NetworkError>) -> Void) {
        
        guard let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/login.php") else {
            print("invalid URL")
            return
        }
        
        let paramString = String(format:"email=%@&password=%@", email, password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        var isValidatedDataResponse = false
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299) ~= response.statusCode else {
                completionHandler(.failure(.badStatusCode))
                return
            }
            print("Login Client - Status code: \(response.statusCode)")
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
           
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                isValidatedDataResponse = self.loginValidation(response: loginResponse)
                completionHandler(.success(isValidatedDataResponse))
            } catch let error {
                completionHandler(.failure(.invalidData))
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
    private func loginValidation(response : LoginResponse) -> Bool {
        response.code == "Success" && response.message == "Login Successful!" ? true : false
    }
    
    private init() {}

    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
}
