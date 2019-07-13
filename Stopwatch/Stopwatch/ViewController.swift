//
//  ViewController.swift
//  Stopwatch
//
//  Created by Daniel Favano on 7/9/19.
//  Copyright © 2019 Daniel Favano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var hoursLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var resumeButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timer : Timer? = Timer()
    var seconds : Int = 0
    var isStarted : Bool = false
    let buttonCornerRoundness : CGFloat = 5
    let borderWidth : CGFloat = 1
    let stopColorScheme : CGColor = UIColor.red.cgColor
    let startColorScheme : CGColor = UIColor.green.cgColor
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyStyles()
    }
    
    @IBAction func startButton(_ sender: Any) {
        
        if(!isStarted){
            
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in self.updateTimeLabels() }
            isStarted = true
        }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        
        timer?.invalidate()
        isStarted = false
        
        startButton.isHidden = true
        stopButton.isHidden = true
        resumeButton.isHidden = false
        resetButton.isHidden = false
    }
    
    @IBAction func resumeButton(_ sender: Any) {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in self.updateTimeLabels() }
        isStarted = true
        
        resumeButton.isHidden = true
        resetButton.isHidden = true
        startButton.isHidden = false
        stopButton.isHidden = false
        
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        timer?.invalidate()
        timer = nil
        isStarted = false
        
        hoursLabel.text = "00"
        minutesLabel.text = "00"
        secondsLabel.text = "00"
        seconds = 0
        
        resumeButton.isHidden = true
        resetButton.isHidden = true
        startButton.isHidden = false
        stopButton.isHidden = false
    }
    
    func updateTimeLabels() {
        
        seconds += 1
        let time = Time(Seconds: seconds)
        
        hoursLabel.text = time.hoursAsString()
        minutesLabel.text = time.minutesAsString()
        secondsLabel.text = time.secondsAsString()
    }
    
    func applyStyles(){
        
        //Button styles
        startButton.layer.cornerRadius = buttonCornerRoundness
        startButton.layer.borderWidth = borderWidth
        startButton.layer.borderColor = startColorScheme
        
        resumeButton.layer.cornerRadius = buttonCornerRoundness
        resumeButton.layer.borderWidth = borderWidth
        resumeButton.layer.borderColor = startColorScheme
        
        stopButton.layer.cornerRadius = buttonCornerRoundness
        stopButton.layer.borderWidth = borderWidth
        stopButton.layer.borderColor = stopColorScheme
        
        resetButton.layer.cornerRadius = buttonCornerRoundness
        resetButton.layer.borderWidth = borderWidth
        resetButton.layer.borderColor = stopColorScheme
    }
}
