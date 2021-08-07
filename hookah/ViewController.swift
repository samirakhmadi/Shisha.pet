//
//  ViewController.swift
//  hookah
//
//  Created by Samir Akhmadi on 07.08.2021.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!

    
    var timer = Timer()
    var player: AVAudioPlayer!
    var totalTime = 0
    var secondsPassed = 0
    


    @IBAction func hardnessSelected(_ sender: UIButton) {
        let tagButton = sender.tag
        print(tagButton)
        
        timer.invalidate()
        
        totalTime = tagButton
        
        progressBar.progress = 0.0
        secondsPassed = 0
     

        timer = Timer.scheduledTimer(timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
    }
    
    @objc func updateTimer() {
      
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            print(Float(secondsPassed) / Float(totalTime))
        } else {
            timer.invalidate()
                        
            let url = Bundle.main.url(forResource: "SM", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }

}
