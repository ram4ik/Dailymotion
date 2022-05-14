//
//  Service.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import Foundation

class Service: ObservableObject {
    
    @Published var videoDetails: VideoDetailsViewData?
     
    func getVideoDetails(videoId: String) {
        guard let url = URL(string: "https://api.dailymotion.com/video/\(videoId)?fields=id,title,language,description,owner.views_total,thumbnail_720_url,country") else { fatalError("Invalid URL") }
        
        let networkManager = NetworkManager()
        
        networkManager.request(fromURL: url) { (result: Result<VideoDetailsViewData, Error>) in
            switch result {
            case .success(let data):
                debugPrint("Got data: \(data)")
                self.videoDetails = data
            case .failure(let error):
                debugPrint("Error: \(error.localizedDescription)")
            }
        }
    }
}
