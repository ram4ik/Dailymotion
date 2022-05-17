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
    
    let vc = AVPlayerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url = URL(string: randomVideos.randomElement()!) else { return }
        
        let player = AVPlayer(url: url)
        
        
        vc.player = player
        NotificationCenter.default.addObserver(self, selector: #selector(playerDidFinishPlaying), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: vc.player?.currentItem)
        
        present(vc, animated: true) { [self] in
            vc.player?.play()
        }
    }
    
    @objc func playerDidFinishPlaying(note: NSNotification) {
        vc.dismiss(animated: true, completion: nil)
    }
}
