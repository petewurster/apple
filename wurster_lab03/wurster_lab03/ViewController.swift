import UIKit

class ViewController: UIViewController {

    //create 2 clocks and a heartbeat signal
    let topClock: Clock = Clock()
    let bottomClock: Clock = Clock()
    var pulse: Timer = Timer()

    //create top button
    @IBOutlet weak var topLabel: UIButton!
    @IBAction func topClockTapped(_ sender: UIButton) {
        updateLabels()
        topClock.switchClocks(bottomClock)
    }
    
    //create bottom button
    @IBOutlet weak var bottomLabel: UIButton!
    @IBAction func bottomClockTapped(_ sender: UIButton) {
        updateLabels()
        bottomClock.switchClocks(topClock)
    }
    
    //reset both clocks
    @IBAction func resetButton(_ sender: UIButton) {
        //to prevent doubling, disable and then...
        pulse.invalidate()
        Clock.resetClocks(topClock, bottomClock)
        updateLabels()
        //... re-enable the pulse
        pulse = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.checkClocks), userInfo: nil, repeats: true)
    }
    
    //send message allowing Clocks to update themselves
    @objc func checkClocks() {
        Clock.updateStatus(topClock, bottomClock)
        updateLabels()
        //disable pulse when somebody has run out of time
        if topClock.label == topClock.endMessage || bottomClock.label == bottomClock.endMessage {
            pulse.invalidate()
        }
    }
    
    //self-explanatory
    func updateLabels() {
        topLabel.setTitle(topClock.label, for: .normal)
        bottomLabel.setTitle(bottomClock.label, for: .normal)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topLabel.setTitle(topClock.label, for: .normal)
        bottomLabel.setTitle(bottomClock.label, for: .normal)
        pulse = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.checkClocks), userInfo: nil, repeats: true)
    }

}

