//
//  PlayerControllerView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 17.05.2022.
//

import SwiftUI

struct PlayerControllerView: View {
    var body: some View {
        ZStack {
            ProgressView()
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
