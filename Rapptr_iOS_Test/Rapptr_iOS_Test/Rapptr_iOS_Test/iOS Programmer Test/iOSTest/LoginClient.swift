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
    
    func login(with email: String, password: String, completionHandler: @escaping (Result<Bool,Error>) -> Void) {
        
        guard let url = URL(string: "http://dev.rapptrlabs.com/Tests/scripts/login.php") else {
            print("invalid URL")
            return
        }
        
        let paramString = String(format:"email=%@&password=%@", email, password)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        var isValidatedDataResponse = false
        
        let session = URLSession.shared
        session.dataTask(with: request) { data, _, error in
            
            guard let data = data else { return }
            
            var response : LoginResponse?
            
            do {
                response = try JSONDecoder().decode(LoginResponse.self, from: data)
            } catch let error {
                print("Error", error)
            }
            
            guard response != nil else { return }
            
            isValidatedDataResponse = self.loginValidation(response: response!)
            
            completionHandler(.success(isValidatedDataResponse))

        }.resume()
    }
    
    private func loginValidation(response : LoginResponse) -> Bool {
        response.code == "Success" && response.message == "Login Successful!" ? true : false
    }
    
    private init() {}

    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
}
