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
    
    let randomVideos = [
        "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
        "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        guard let url = URL(string: randomVideos.randomElement()!) else { return }
        
        let player = AVPlayer(url: url)
        player.isMuted = true
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
