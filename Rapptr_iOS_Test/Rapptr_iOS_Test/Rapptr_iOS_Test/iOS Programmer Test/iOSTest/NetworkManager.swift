//
//  ClientManager.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/14/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import UIKit

public enum NetworkError: CustomStringConvertible, Error {
    public var description: String {
        switch self {
        case .unableToComplete:
            return "Unable to complete your request. Please check your internet connection."
        case .invalidResponse:
            return "Invalid response from the server. Please try again."
        case .invalidData:
            return "The data recieved from the server was invalid. Please try again."
        case let .unableToDecodeJSON(error):
            return "JSONDecodingError \(error)"
        }
    }
    
    case unableToComplete
    case invalidResponse
    case invalidData
    case unableToDecodeJSON(Error)
}

class NetworkManager {
    
    // MARK: - Static Properties
    static let shared = NetworkManager()
 
    // MARK: - Private Properties and Initializers
    private let urlSession = URLSession(configuration: .default)
    private init() {}
    
    
    // MARK: - Methods
    func getData(from urlString: String, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completionHandler(.failure(.unableToComplete))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let _ = error {
                completionHandler(.failure(.unableToComplete))
                return
            }
            
            guard let urlResponse = response as? HTTPURLResponse else {
                completionHandler(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.invalidData))
                return
            }
            
            switch urlResponse.statusCode {
            case 200...299: break
            default:
                completionHandler(.failure(.invalidResponse))
                return
            }
            completionHandler(.success(data))
        }
        
        task.resume()
    }
}
