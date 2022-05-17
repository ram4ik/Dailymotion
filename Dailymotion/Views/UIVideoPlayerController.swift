//
//  UIVideoPlayerController.swift
//  Dailymotion
//
//  Created by Ramill Ibragimov on 17.05.2022.
//

import AVKit
import Foundation
import UIKit

class UIVideoPlayerController: UIViewController {
    
    let randomVideos = [
        "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
        "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url = URL(string: randomVideos.randomElement()!) else { return }
        
        let player = AVPlayer(url: url)
        
        let vc = AVPlayerViewController()
        vc.player = player
        vc.player?.play()
        present(vc, animated: true)
    }
}
