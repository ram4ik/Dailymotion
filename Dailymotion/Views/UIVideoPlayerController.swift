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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url = URL(string: PreConfiguredVideos.randomVideos.randomElement()!) else { return }
        
        let player = AVPlayer(url: url)
        
        let vc = AVPlayerViewController()
        vc.player = player
        vc.player?.play()
        present(vc, animated: false)
    }
}
