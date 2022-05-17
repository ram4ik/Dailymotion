//
//  VideoPlaybackControllerView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 17.05.2022.
//

import SwiftUI

struct VideoPlaybackControllerView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }

    func makeUIViewController(context: Context) -> some UIVideoPlayerController {
        return UIVideoPlayerController()
    }
    
}
