//
//  ChannelVideosView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import SwiftUI

struct ChannelVideosView: View {
    @ObservedObject var service: Service
    
    var body: some View {
        NavigationView {
            List(service.videoData) { video in
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
                service.getVideos()
            }
            .onAppear() {
                service.getVideos()
            }
            .navigationTitle("videos-string")
        }.navigationViewStyle(.stack)
    }
}

struct ChannelVideosView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelVideosView(service: Service())
    }
}
