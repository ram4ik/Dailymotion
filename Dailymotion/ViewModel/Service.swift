//
//  Service.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import Foundation

class Service: ObservableObject {
    @Published var channelData: [Channel] = []
    @Published var videoData: [Video] = []
    @Published var videoDetails: VideoDetailsViewData?
    @Published var channelVideos: [ChannelVideo] = []
    
    let networkManager = NetworkManager()
    
    func getChannels() {
        guard let url = URL(string: "https://api.dailymotion.com/channels") else { fatalError("Invalid URL") }

        networkManager.request(fromURL: url) { (result: Result<ChannelViewData, Error>) in
            switch result {
            case .success(let data):
                debugPrint("Got data: \(data)")
                self.channelData = data.list
            case .failure(let error):
                debugPrint("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getVideos() {
        guard let url = URL(string: "https://api.dailymotion.com/videos") else { fatalError("Invalid URL") }

        networkManager.request(fromURL: url) { (result: Result<ChannelVideosViewData, Error>) in
            switch result {
            case .success(let data):
                debugPrint("Got data: \(data)")
                self.videoData = data.list
            case .failure(let error):
                debugPrint("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getVideoDetails(videoId: String) {
        guard let url = URL(string: "https://api.dailymotion.com/video/\(videoId)?fields=id,title,language,description,owner.views_total,thumbnail_720_url,country") else { fatalError("Invalid URL") }

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
    
    func getChannelVideos(channelId: String) {
        guard let url = URL(string: "https://api.dailymotion.com/channel/\(channelId)/videos") else { fatalError("Invalid URL") }

        networkManager.request(fromURL: url) { (result: Result<ChannelVideosData, Error>) in
            switch result {
            case .success(let data):
                debugPrint("Got data: \(data)")
                self.channelVideos = data.list
            case .failure(let error):
                debugPrint("Error: \(error.localizedDescription)")
            }
        }
    }
}
