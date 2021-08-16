//
//  Message.swift
//  iOSTest
//
//  Created by Jocelyn Boyd on 8/14/21.
//  Copyright © 2021 D&ATechnologies. All rights reserved.
//

import Foundation

struct MessageWrapper: Decodable {
    let data: [Message]
}

struct Message: Decodable {
    let user_id: String
    let name: String
    let avatar_url: String
    let message: String
}
