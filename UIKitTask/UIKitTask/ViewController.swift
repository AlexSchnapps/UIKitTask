//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()
    var slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.frame = CGRect(x: 0, y: 0, width: 23, height: 200)
        slider.center = view.center
        slider.minimumValue = 0.0
        slider.maximumValue = 100.0
        view.addSubview(slider)
        
        
        do {
            if let audiopatch = Bundle.main.path(forResource: "Mit dem Wind", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audiopatch))
                slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        self.player.play()
    }
    
    //MARK: - Action
    @IBAction func playButton(_ sender: UIButton) {
        player.play()
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        player.stop()
    }
}

