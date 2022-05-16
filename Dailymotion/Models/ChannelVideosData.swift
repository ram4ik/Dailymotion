//
//  ChannelVideosData.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 16.05.2022.
//

import Foundation

struct ChannelVideosData: Codable {
    let page, limit: Int
    let explicit: Bool
    let total: Int
    let hasMore: Bool
    let list: [ChannelVideo]

    enum CodingKeys: String, CodingKey {
        case page, limit, explicit, total
        case hasMore = "has_more"
        case list
    }
}

struct ChannelVideo: Codable, Identifiable {
    let id, title, channel, owner: String
}
