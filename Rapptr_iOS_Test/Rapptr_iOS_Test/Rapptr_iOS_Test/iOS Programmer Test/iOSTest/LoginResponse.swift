//
//  LoginResponse.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/16/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import Foundation

struct LoginResponse : Decodable {
    let code : String
    let message : String
}
