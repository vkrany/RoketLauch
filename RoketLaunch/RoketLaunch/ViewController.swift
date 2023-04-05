//
//  ViewController.swift
//  RoketLaunch
//
//  Created by Владимир Красный on 05.04.2023.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    @IBOutlet weak var roketContentView: UIView!
    @IBOutlet weak var roketImageView: UIImageView!
    @IBOutlet weak var sucessLabel: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let path = Bundle.main.path(forResource: "launch", ofType: "mp3")
        let url = URL(fileURLWithPath: path!)
        player = try? AVAudioPlayer(contentsOf: url)
        player.prepareToPlay()
    }


    @IBAction func powerButtonPressed(_ sender: Any) {
        roketContentView.isHidden = false
        player.play()
        sucessLabel.isHidden = true
        let frame = roketImageView.frame
        roketImageView.frame.origin.y = 1000
        UIView.animate(withDuration: 3.5, animations: {
            self.roketImageView.frame = frame
        }) {(_) in
            self.sucessLabel.isHidden = false
        }
    }
}

