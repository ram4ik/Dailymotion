//
//  VideoPlaybackControllerView.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 17.05.2022.
//

import AVKit
import SwiftUI

struct VideoPlaybackControllerView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
       
        guard let randomVideoURL = PreConfiguredVideos.randomVideos.randomElement(),
              let url = URL(string: randomVideoURL) else {
            
            assertionFailure("Unexpected `randomVideo` url is nil.")
            return AVPlayerViewController()
        }
        
        let player = AVPlayer(url: url)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        return playerViewController
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        
    }
}
