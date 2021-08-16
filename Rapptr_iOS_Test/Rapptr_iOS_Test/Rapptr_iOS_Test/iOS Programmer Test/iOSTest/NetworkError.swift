//
//  NetworkError.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/16/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case invalidUsername
    case unableToComplete
    case invalidResponse
    case invalidData
    case badStatusCode
}
