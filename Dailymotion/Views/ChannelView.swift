//
//  ChannelView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import SwiftUI

struct ChannelView: View {
    @ObservedObject var service: Service
    
    var body: some View {
        NavigationView {
            List(service.channelData) { channel in
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
                service.getChannels()
            }
            .onAppear() {
                service.getChannels()
            }
            .navigationTitle("channels-string")
        }
    }
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView(service: Service())
    }
}
