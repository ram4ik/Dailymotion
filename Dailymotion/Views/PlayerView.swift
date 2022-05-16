//
//  PlayerView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        ZStack {
            ProgressView()
            VideoPlaybackView()
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
