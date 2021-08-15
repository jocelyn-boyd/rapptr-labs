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

class ChatClient {
    
    static let manager = ChatClient()
    private init() {}
   
    func fetchAllMessages(completionHandler: @escaping (Result<[Message],NetworkError>) -> Void) {
        
        let endpoint = URL(string:"http://dev.rapptrlabs.com/Tests/scripts/chat_log.php")!
        
        NetworkManager.shared.performDataTask(withUrl: endpoint, andMethod: .get) { result in
            switch result {
            case let .success(data):
                do {
                    let message = try MessageWrapper.getAllChatMessages(from: data)
                    completionHandler(.success(message))
                } catch {
                    completionHandler(.failure(.unableToDecodeJSON(error)))
                    print(error.localizedDescription)
                }
            case let .failure(error):
                completionHandler(.failure(.unableToDecodeJSON(error)))
                print(error.localizedDescription)
            }
        }
    }
}
