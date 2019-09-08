//
//  ViewController.swift
//  You Are Awesome!
//
//  Created by Zach Ogden on 8/29/19.
//  Copyright © 2019 Zach Ogden. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var awesomeImageView: UIImageView!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var soundSwitch: UISwitch!
    var awesomePlayer = AVAudioPlayer()
    var index = -1
    var imageIndex = -1
    var soundIndex = -1
    let numberOfImages = 10
    let numberOfSounds = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer) {
    // Can we load in the file soundName?
    if let sound = NSDataAsset(name: soundName) {
        // check if sound.dat is a sound file
        do {
            try audioPlayer = AVAudioPlayer(data: sound.data)
            audioPlayer.play()
        } catch {
            // if sound.data is not a valid audio file
            print("ERROR: data in \(soundName) couldn't be played as a sound.")
            }
    } else {
        // if reading in the NSDataAsset didn't work, tell the developer / report the error
        print("ERROR: file /(soundName) didn't load")
    }
}
    
    func nonRepeatingRandom(lastNumber: Int , maxValue: Int) -> Int {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<maxValue)
        } while lastNumber == newIndex
        return newIndex
    }
    
    @IBAction func soundSwitchPressed(_ sender: Any) {
        if soundSwitch.isOn == false && soundIndex != -1{
            awesomePlayer.stop()
        }
    }
    
    @IBAction func showMessagedPressed(_ sender: Any) {
        let messages = ["You Are Awesome!",
                        "You Are Great!",
                        "You Are Fantastic!",
                        "When the Genius Bar needs help, they call you",
                        "You brighten my day!",
                        "You are ds bomb!",
                        "Hey, fabulous!",
                        "You are tremendous",
                        "You've got the design skills of Jony Ive!",
                        "I am so excited to download the app!"]
        
        // show a message
        index = nonRepeatingRandom(lastNumber: index, maxValue: messages.count)
        messageLabel.text = messages[index]
        
        // show an image
        imageIndex = nonRepeatingRandom(lastNumber: imageIndex, maxValue: numberOfImages)
        awesomeImageView.image = UIImage(named: "image\(imageIndex)")
        
        //if soundSwitch.isOn == true {
        if soundSwitch.isOn {
            
            // get a random number to use in soundname file
            soundIndex = nonRepeatingRandom(lastNumber: soundIndex, maxValue: numberOfSounds)
            
            // play a sound
            let soundName = "sound\(soundIndex)"

            playSound(soundName: soundName, audioPlayer: &awesomePlayer)
        }
        print("test")
        
    }
}
