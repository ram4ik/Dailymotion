//
//  VideoDetailsViewData.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import Foundation

struct VideoDetailsViewData: Codable {
    let id, title, language, welcomeDescription: String
    let ownerViewsTotal: Int
    let thumbnail720_URL: String
    let country: String

    enum CodingKeys: String, CodingKey {
        case id, title, language
        case welcomeDescription = "description"
        case ownerViewsTotal = "owner.views_total"
        case thumbnail720_URL = "thumbnail_720_url"
        case country
    }
}
