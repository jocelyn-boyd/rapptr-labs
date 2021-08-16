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
    
    func fetchAllMessages(completionHandler: @escaping (Result<[Message],AppError>) -> Void) {
        
        guard let endpoint = URL(string:"http://dev.rapptrlabs.com/Tests/scripts/chat_log.php") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: endpoint) { data , response, error  in
            
            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200...299) ~= response.statusCode else {
                completionHandler(.failure(.badStatusCode))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            do {
                let messages = try JSONDecoder().decode(MessageWrapper.self, from: data)
                completionHandler(.success(messages.data))
            } catch {
                completionHandler(.failure(.invalidData))
            }
        }
        task.resume()
    }
}
