//
//  File.swift
//  
//
//  Created by Maxime DELESCOT on 16/05/2023.
//

import Foundation

struct Celebrity: Codable {
    let availability: Availability
    let name: String
    let time: Time
    let url: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case availability, name
        case time = "created_at"
        case url = "file_public_url"
        case id
    }
}

enum Availability: String, Codable, CaseIterable {
    case free = "free"
    case premium = "premium"
    case unlock = "unlock"
    case none = "none"
}

struct Time: Codable {
    let seconds: Int
    let nanoseconds: Int
}
