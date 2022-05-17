//
//  ChannelView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import SwiftUI

struct ChannelView: View {
    @ObservedObject var service: Service
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some View {
        NavigationView {
            ZStack {
                List(service.channelData) { channel in
                    NavigationLink(destination: RenderedChannelVideosView(channelId: channel.id, name: channel.name, service: service)) {
                        HStack {
                            VStack {
                                ZStack {
                                    Image("placeholder")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .cornerRadius(.infinity)
                                    Image("\(channel.id)")
                                        .resizable()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .scaledToFit()
                                        .cornerRadius(.infinity)
                                }
                                .shadow(color: .secondary, radius: 4, x: 0, y: 3)
                                .padding(.vertical)
                                Spacer()
                            }
                            
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
                    }
                }
                if service.channelData.isEmpty {
                    VStack {
                        ProgressView()
                        if !networkMonitor.isActive {
                            Text("no-network-string")
                                .padding()
                        }
                    }
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
        }.navigationViewStyle(.stack)
    }
}

struct ChannelView_Previews: PreviewProvider {
    static var previews: some View {
        ChannelView(service: Service())
    }
}
