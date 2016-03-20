//
//  PlaySoundsViewController.swift
//  Pitch Perfect(nd)
//
//  Created by Shravan Sukumar on 17/03/16.
//  Copyright © 2016 shravan. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var recordedAudio : NSURL!

    
    var audioFile : AVAudioFile!
    var audioEngine : AVAudioEngine!
    var audioPlayerNode : AVAudioPlayerNode!
    var stopTimer : NSTimer!
    var recordedAudioURL : NSURL!
    
    enum buttonType : Int { case Slow = 0, Fast, Chipmunk, Vader, Echo, Reverb}
    
    @IBAction func playSoundForButton(sender: UIButton) {
        print("Play sound button pressed")
        switch(buttonType(rawValue: sender.tag)!){
        case .Slow:
            playSound(rate:0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Chipmunk:
            playSound(pitch: 1000)
        case .Vader:
            playSound(pitch: -1000)
        case .Echo:
            playSound(echo: true)
        case.Reverb:
            playSound(reverb: true)
            }
        configureUI(.Playing)
    }
    
    @IBAction func stopButtonPressed(sender: UIButton) {
        print("Stop button pressed")
        stopAudio()
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
