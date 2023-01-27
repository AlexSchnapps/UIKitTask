//
//  ViewController.swift
//  UIKitTask
//
//  Created by Alex Schnapps on 20.01.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    //MARK: - outlet
    
    @IBOutlet weak var sliderBoard: UIView!
    
    var player = AVAudioPlayer()
    var slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //MARK: - Slider
        slider.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
        slider.center = self.view.center
        slider.minimumValue = 0.0
        slider.maximumValue = 200.0
        slider.tintColor = .green
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .yellow
        slider.isContinuous = false
        view.addSubview(slider)
        slider.addTarget(self, action: #selector(changeSlider), for: .valueChanged)
        
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
    
    @objc func changeSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    //MARK: - Action
    @IBAction func playButton(_ sender: UIButton) {
        player.play()
    }
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        player.stop()
    }
    
    
    @IBAction func sliderAction(_ sender: Any) {
      //  self.player.volume = self.sliderBoard.
    }
    
}

