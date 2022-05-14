//
//  VideoDetailsView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import SwiftUI

struct VideoDetailsView: View {
    let videoId: String
    @ObservedObject var service: Service
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                AsyncImage(url: URL(string: service.videoDetails?.thumbnail720_URL ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .cornerRadius(16)
                .padding()
                
                VStack(alignment: .leading) {
                    Text(service.videoDetails?.title ?? "n/a")
                        .bold()
                        .padding(.vertical)
                    Text(service.videoDetails?.welcomeDescription ?? "n/a")
                        .foregroundColor(.secondary)
                    Text("Country: \(service.videoDetails?.country ?? "n/a")")
                        .foregroundColor(.secondary)
                        .padding(.top)
                    Text("Launguage: \(service.videoDetails?.language ?? "n/a")")
                        .foregroundColor(.secondary)
                        .padding(.top)
                }.padding()
            }
        }
        .onAppear() {
            service.getVideoDetails(videoId: videoId)
        }
    }
}

struct VideoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        VideoDetailsView(videoId: "", service: Service())
    }
}
