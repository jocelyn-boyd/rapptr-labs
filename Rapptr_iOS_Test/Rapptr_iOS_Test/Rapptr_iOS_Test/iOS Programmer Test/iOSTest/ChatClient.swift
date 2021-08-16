//
//  ChatClient.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/14/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

// * =========================================================================================
// * INSTRUCTIONS
// * =========================================================================================
// * 1) Make a request to fetch chat data used in this app.
// *
// * 2) Using the following endpoint, make a request to fetch data
// *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
// **/

import Foundation

//delete networking manager and do networking in this file :]

class ChatClient {
    
    static let shared = ChatClient()
    private init() {}
    
    func fetchAllMessages(completionHandler: @escaping (Result<[Message],Error>) -> Void) {
        
        guard let endpoint = URL(string:"http://dev.rapptrlabs.com/Tests/scripts/chat_log.php") else {
            return
        }
        
        let urlSession = URLSession.shared.dataTask(with: endpoint) { data , reponse , error  in
            
            guard let data = data, error == nil else {
                print("Error fetching Data.")
                return
            }
            
            var results : MessageWrapper?
            
            do {
                results = try JSONDecoder().decode(MessageWrapper.self, from: data)
            } catch let error {
                print("Error", error)
            }
            
            guard let json = results else {return}
            
            completionHandler(.success(json.data))
        }
 
        urlSession.resume()
    }
}
