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
            ChannelView(service: Service())
                .tabItem {
                    Label("channels-string", systemImage: "list.dash")
                }
            ChannelVideosView(service: Service())
                .tabItem {
                    Label("videos-string", systemImage: "video")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.locale, Locale.init(identifier: "en"))
            ContentView()
                .environment(\.locale, Locale.init(identifier: "ee"))
            ContentView()
                .environment(\.locale, Locale.init(identifier: "ee-ET"))
            ContentView()
                .environment(\.locale, Locale.init(identifier: "ru"))
        }
    }
}
