//
//  RenderedChannelVideosView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 16.05.2022.
//

import SwiftUI

struct RenderedChannelVideosView: View {
    let channelId: String
    let name: String
    @ObservedObject var service: Service
    
    var body: some View {
        ZStack {
            List(service.channelVideos) { video in
                NavigationLink(destination: PlayerView()) {
                    VStack(alignment: .leading) {
                        Text(video.title)
                            .bold()
                        Text("Owner: \(video.owner)")
                            .foregroundColor(.secondary)
                            .padding(.top, 5)
                    }.padding()
                }
            }
            if service.channelVideos.isEmpty {
                ProgressView()
            }
        }
        .listStyle(PlainListStyle())
        .refreshable {
            service.getChannelVideos(channelId: channelId)
        }
        .onAppear() {
            service.getChannelVideos(channelId: channelId)
        }
        .navigationTitle("\(name)")
    }
}

struct RenderedChannelVideosView_Previews: PreviewProvider {
    static var previews: some View {
        RenderedChannelVideosView(channelId: "fun", name: "Fun", service: Service())
    }
}
