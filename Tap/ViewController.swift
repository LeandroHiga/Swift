//
//  ViewController.swift
//  Tap
//
//  Created by Lean Caro on 20/03/2020.
//  Copyright © 2020 Leandro Higa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // Create timer
    var timer = Timer()
    
    // Create flag (to check if timer is running)
    var isTimerRunning = false
    
    // Crete a timer that keeps track of the number of seconds
    var counter = 0.0
    
    var fractions = 00
    var second = 00
    var minute = 00

    
    // Timer Label
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var fractionsLabel: UILabel!

    // Score Label
    @IBOutlet weak var scoreLabel: UILabel!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newGame()
    }
    
    
    // TAP button
    @IBAction func buttonTapped(_ sender: Any) {
        
        // Check if the timer is NOT running
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.runTimer2), userInfo: nil, repeats: true)
          
            // Now the timer is running so we assign TRUE to the variable
            isTimerRunning = true
        }
        
        // Add 1
        score += 1
        scoreLabel.text = String(score)
        
        // N taps reached
        if score == 50 {
            //timer.invalidate()
            showAlert()
            timer.invalidate()
        }
        
    }

    // Restart button
    @IBAction func restartGame(_ sender: Any) {
        newGame()
    }
    
    // Start a new game
    func newGame() {
        // Initialize score label with 0
        score = 0
        scoreLabel.text = String(score)
        
        timer.invalidate()
        isTimerRunning = false
        
        // Reset Counter
        counter = 0.0
        
        timerLabel.text = "00"
        fractionsLabel.text = ".00"
        
    }
    
    @IBAction func showAlert() {
        
        let title = "Great!"
        // Create the message
        let message = "You reached 50 taps in \(timerLabel.text ?? "0")\(fractionsLabel.text ?? "0")"
        
        // Create UIAlertController
        // Upper body of the notification
        let alert = UIAlertController(title: "\(title)", message: message, preferredStyle: .alert)
        
        // Create UIAlertAction
        // Button (the one that user press)
        // The handler code is executed when the button is tapped
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.newGame()
        })
        
        // Add the action to the created alert
        alert.addAction(action)
        
        // Present alert
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Helper Methods
    
    // @objc because is an objective-c function
    /* @objc func  runTimer() {
        counter += 0.01
        
        // HH:MM:SS:_
        let flooredCounter = Int(floor(counter))

        let minute = (flooredCounter % 36000) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
                   secondString = "0\(second)"
               }
        
        let decisecond = String(format: "%.1f", counter).components(separatedBy: ".").last!
        
        // Update Timer Label
        timerLabel.text = "\(minuteString):\(secondString).\(decisecond)"
    }
    */
    
    @objc func runTimer2() {
        
        fractions += 1
        var secondString = "\(second)"
        // var minuteString = "\(minute)"

        if fractions > 99 {
            second += 1
            fractions = 0
        }
        
        if second < 10 {
            secondString = "0\(second)"
        }
        
        timerLabel.text = "\(secondString)"
        fractionsLabel.text = ".\(fractions)"
    }
    
}
