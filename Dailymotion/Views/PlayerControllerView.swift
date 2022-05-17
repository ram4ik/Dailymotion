//
//  PlayerControllerView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 17.05.2022.
//

import SwiftUI

struct PlayerControllerView: View {
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
            VStack {
                VideoPlaybackControllerView()
            }
        }
    }
}

struct PlayerControllerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerControllerView()
    }
}
