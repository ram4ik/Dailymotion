//
//  ContentView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 14.05.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ChannelView()
                .tabItem {
                    Label("Channel", systemImage: "list.dash")
                }
            ChannelVideosView()
                .tabItem {
                    Label("Videos", systemImage: "video")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
