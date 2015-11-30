//
//  ViewController.swift
//  retro-calculator
//
//  Created by Lympe on 29/11/15.
//  Copyright © 2015 Lympe. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var outputLbl: UILabel!
    
    var btnSound = AVAudioPlayer!()

        override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("btn", ofType: "wav")
        let soundURL = NSURL(fileURLWithPath: path!)
        
        do{
            try btnSound = AVAudioPlayer(contentsOfURL: soundURL)
            btnSound.prepareToPlay()
        }catch let err as NSError{
            //Print error description
            print(err.debugDescription)
        }
        
    }
    
    @IBAction func numberPressed(btn: UIButton!){
        btnSound.play()
        
    }

    
    
    


}

