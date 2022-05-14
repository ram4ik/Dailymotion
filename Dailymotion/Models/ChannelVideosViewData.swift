//
//  ChannelVideosViewData.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import Foundation

struct ChannelVideosViewData: Codable {
    let page, limit: Int
    let explicit: Bool
    let total: Int
    let hasMore: Bool
    let list: [Video]

    enum CodingKeys: String, CodingKey {
        case page, limit, explicit, total
        case hasMore = "has_more"
        case list
    }
}

struct Video: Codable, Identifiable {
    let id, title, channel, owner: String
}
