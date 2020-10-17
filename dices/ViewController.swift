//
//  ViewController.swift
//  dices
//
//  Created by Matthew Pietrucha on 10/17/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var diceImageView : UIImageView!
    @IBOutlet var criticalLabel : UILabel!
    
    var audioPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonGotPressed() {
        rollDice()
    }
    
    func rollDice() {
        playSound(sound: "roll", type: "wav")
        print("We rollin dice")
        
        let rolledNumber = Int.random(in: 1...20)
        
        let imageName = "d\(rolledNumber)"
        
        diceImageView.image = UIImage(named: imageName)
        
        if(imageName == "d1") {
            criticalLabel.text = "Critical MAC!"
            playSound(sound: "boo", type: "wav")
        } else if(imageName == "d20") {
            criticalLabel.text = "Critical Windows!"
            playSound(sound: "yay", type: "wav")
        } else {
            criticalLabel.text = ""
        }
        
        
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        rollDice()
    }
    
    func playSound(sound: String, type: String ) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
                
            } catch {
                print{ "ERROR: Could not find and play the sound file!"}
            }
        }
    }

}

