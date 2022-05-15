//
//  ChannelView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import SwiftUI

struct ChannelView: View {
    @State private var channelData: [Channel] = []
    
    var body: some View {
        NavigationView {
            List(channelData) { channel in
                VStack(alignment: .leading) {
                    Text(channel.name)
                        .font(.title)
                        .bold()
                        .padding()
                    Text(channel.listDescription)
                        .foregroundColor(.secondary)
                        .padding(.horizontal)
                }
            }
            .listStyle(PlainListStyle())
            .refreshable {
                getChannels()
            }
            .onAppear() {
                getChannels()
            }
            .navigationTitle("channels-string")
        }
    }
    
    private func getChannels() {
        guard let url = URL(string: "https://api.dailymotion.com/channels") else { fatalError("Invalid URL") }
        
        let networkManager = NetworkManager()
        
        networkManager.request(fromURL: url) { (result: Result<ChannelViewData, Error>) in
            switch result {
            case .success(let data):
                debugPrint("Got data: \(data)")
                channelData = data.list
            case .failure(let error):
                debugPrint("Error: \(error.localizedDescription)")
            }
        }
    }
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView()
    }
}
