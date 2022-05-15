//
//  PlayerView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import SwiftUI

struct PlayerView: View {
    var body: some View {
        VStack {
            VideoPlaybackView()
                .padding()
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}
