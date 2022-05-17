//
//  PlayerView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import SwiftUI

struct PlayerView: View {
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some View {
        ZStack {
            VStack {
                ProgressView()
                if !networkMonitor.isActive {
                    Text("no-network-string")
                        .padding()
                }
            }
            VideoPlaybackView()
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
