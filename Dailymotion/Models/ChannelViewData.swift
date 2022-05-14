//
//  ChannelViewData.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import Foundation

struct ChannelViewData: Codable {
    let page, limit: Int
    let explicit: Bool
    let total: Int
    let hasMore: Bool
    let list: [Channel]

    enum CodingKeys: String, CodingKey {
        case page, limit, explicit, total
        case hasMore = "has_more"
        case list
    }
}

struct Channel: Codable, Identifiable {
    let id, name, listDescription: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case listDescription = "description"
    }
}
