//
//  UIVideoPlayer.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 15.05.2022.
//

import AVKit
import Foundation

class UIVideoPlayer: UIView {
    
    var playerLayer = AVPlayerLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let url = URL(string: PreConfiguredVideos.randomVideos.randomElement()!) else { return }
        
        let player = AVPlayer(url: url)
        player.isMuted = false
        player.play()
        
        playerLayer.player = player
        playerLayer.videoGravity = AVLayerVideoGravity(rawValue: AVLayerVideoGravity.resizeAspect.rawValue)
        
        layer.addSublayer(playerLayer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
}
