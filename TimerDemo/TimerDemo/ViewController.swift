//
//  ViewController.swift
//  TimerDemo
//
//  Created by Laurence Liss for CIS 200
//

import UIKit

class ViewController: UIViewController {

    // Creates a timer object that will be in scope in all functions in this class.
    var timer: Timer = Timer()

    // Creates a integer variable that will be in scope in all functions in this class.
    var remainingTime = 10

    // A reference to the label in the storyboard.
    @IBOutlet weak var timerLabel: UILabel!

    // An action function that is connected to the start button.
    @IBAction func StartButtonTapped(_ sender: UIButton) {
        /**
          * Updates the timer variable with a new timer that triggers every
          * second (see timerInterval, repeats indefinitely and runs a named
          * function called "updateTimer" that is part of this class. After this
          * line runs, the "updateTimer" function runs every second.
          * #selector(ViewController.updateTimer) is used to indicate the
          * function to run in this ViewController. If you change the name of
          * the function you need to change this.
          */
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }

    // An action function that is connected to the pause button.
    @IBAction func PauseButtonTapped(_ sender: UIButton) {
        // Stops the timer from running ever again.
        timer.invalidate()
    }
    
    // A custom function that will be triggered by the timer.
    @objc func updateTimer() {
        // Decrement the remainingTime and update the label.
        remainingTime -= 1
        timerLabel.text = String(remainingTime)
    }
    
    // Standard view function used to set up the view when the app starts.
    override func viewDidLoad() {
        // Boilerplate, always call the parent's viewDidLoad function.
        super.viewDidLoad()

        // Changes the text in the referenced timerLabel and sets it to the
        // string value of the "remainingTime" integer.
        timerLabel.text = String(remainingTime)
    }
    
}

