//
//  JokesResult.swift
//  ChucknorrisApp
//
//  Created by Juan David Lopera Lopez on 20/01/22.
//

import Foundation

struct JokesResult: Decodable {
    var categories: [String]
    var iconUrl: String
    var description: String
    var createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case categories
        case iconUrl = "icon_url"
        case description = "value"
        case createdAt = "created_at"
    }
}
