//
//  ChannelVideosView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import SwiftUI

struct ChannelVideosView: View {
    @State private var videoData: [Video] = []
    
    var body: some View {
        NavigationView {
            List(videoData) { video in
                NavigationLink {
                    VideoDetailsView(videoId: video.id, service: Service())
                } label: {
                    Text(video.title)
                        .bold()
                        .padding()
                }
            }
            .listStyle(PlainListStyle())
            .refreshable {
                getVideos()
            }
            .onAppear() {
                getVideos()
            }
            .navigationTitle("videos-string")
        }
    }
    
    private func getVideos() {
        guard let url = URL(string: "https://api.dailymotion.com/videos") else { fatalError("Invalid URL") }
        
        let networkManager = NetworkManager()
        
        networkManager.request(fromURL: url) { (result: Result<ChannelVideosViewData, Error>) in
            switch result {
            case .success(let data):
                debugPrint("Got data: \(data)")
                videoData = data.list
            case .failure(let error):
                debugPrint("Error: \(error.localizedDescription)")
            }
        }
    }
}

struct ChannelVideosView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelVideosView()
    }
}
