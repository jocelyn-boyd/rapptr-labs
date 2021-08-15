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


enum HTTPMethod: String {
    case get = "GET"
    case put = "PUT"
}

//class NetworkManager {
//
//    // MARK: - Static Properties
//    static let shared = NetworkManager()
//
//    // MARK: - Private Properties and Initializers
//    private let urlSession = URLSession(configuration: .default)
//    private init() {}
//
//
//    // MARK: - Methods
//    func getData(from urlString: String, completionHandler: @escaping (Result<Data, NetworkError>) -> Void) {
//
//        guard let url = URL(string: urlString) else {
//            completionHandler(.failure(.unableToComplete))
//            return
//        }
//
//        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
//
//            if let _ = error {
//                completionHandler(.failure(.unableToComplete))
//                return
//            }
//
//            guard let urlResponse = response as? HTTPURLResponse else {
//                completionHandler(.failure(.invalidResponse))
//                return
//            }
//
//            guard let data = data else {
//                completionHandler(.failure(.invalidData))
//                return
//            }
//
//            switch urlResponse.statusCode {
//            case 200...299: break
//            default:
//                completionHandler(.failure(.invalidResponse))
//                return
//            }
//            completionHandler(.success(data))
//        }
//
//        task.resume()
//    }
//}

class NetworkManager {
    
    // MARK: - Static Properties
    
    static let shared = NetworkManager()
    
    // MARK: - Internal Properties
    
    func performDataTask(withUrl url: URL,
                                             andHTTPBody body: Data? = nil,
                                             andMethod httpMethod: HTTPMethod,
                                             completionHandler: @escaping ((Result<Data, NetworkError>) -> Void)) {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod.rawValue
        request.httpBody = body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        urlSession.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    completionHandler(.failure(.unableToComplete))
                    return
                }
                
                guard let response = response as? HTTPURLResponse, (200...299) ~= response.statusCode else {
                    completionHandler(.failure(.invalidResponse))
                    return
                }
                
                if let error = error {
                    let error = error as NSError
                    if error.domain == NSURLErrorDomain && error.code == NSURLErrorNotConnectedToInternet {
                        completionHandler(.failure(.unableToComplete))
                        return
                    } else {
                        completionHandler(.failure(.unableToComplete))
                        return
                    }
                }
                completionHandler(.success(data))
            }
        }.resume()
    }
    
    // MARK: - Private Properties and Initializers
    
    private let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    
    private init() {}
}
