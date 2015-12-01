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
    
    enum Operation: String{
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        //case Equals = "="
        case Empty = "Empty"
    }
    
    @IBOutlet weak var outputLbl: UILabel!
   
    //Properties
    var btnSound = AVAudioPlayer!()
    var runningNumber = ""
    var leftValStr = ""
    var rightValStr = ""
    var result = ""
    var currentOperation: Operation = Operation.Empty
    
    
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
        //playSound()
        runningNumber += "\(btn.tag)"
        outputLbl.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: AnyObject) {
        processOperation(Operation.Divide)
    }
    
    @IBAction func onMultiply(sender: AnyObject) {
        processOperation(Operation.Multiply)

    }
    
    @IBAction func onSubtractPressed(sender: AnyObject) {
        processOperation(Operation.Subtract)

    }
    
    @IBAction func onAdditionPressed(sender: AnyObject) {
        processOperation(Operation.Add)

    }
    
    @IBAction func onEqualPressed(sender: AnyObject) {
        processOperation(currentOperation)

    }
    
    func processOperation(op: Operation){
        //playSound()
        if currentOperation != Operation.Empty{
            if runningNumber != ""{
                rightValStr = runningNumber
                runningNumber = ""
                if currentOperation == Operation.Multiply{
                    result = "\(Double(leftValStr)! * (Double(rightValStr))!)"
                }else if currentOperation == Operation.Divide{
                    result = "\(Double(leftValStr)! / (Double(rightValStr))!)"
                }else if currentOperation == Operation.Subtract{
                    result = "\(Double(leftValStr)! - (Double(rightValStr))!)"
                }else if currentOperation == Operation.Add{
                    result = "\(Double(leftValStr)! + (Double(rightValStr))!)"
                }
                leftValStr = result
                outputLbl.text = result

            }
            currentOperation = op
        }else{
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = op
        }
    }
    
    func playSound(){
        if btnSound.play(){
            btnSound.stop()
        }
        btnSound.play()
    }
    
    
    

    
    
    


}

