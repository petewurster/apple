import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var boatName: UITextField!
    @IBOutlet weak var hh: UITextField!
    @IBOutlet weak var mm: UITextField!
    @IBOutlet weak var ss: UITextField!
    @IBOutlet weak var resultsView: UITextView!
    var boatList = [String : TimeStamp]()

    @IBAction func showStatus(_ sender: UIButton) {
        if boatName.text == "" {
            clearFields()
        }else{
            //create new struct instance with timestamp for the boat
            let newBoatTime = TimeStamp(hh: Int(hh.text!) ?? 0,
                                        mm: Int(mm.text!) ?? 0,
                                        ss: Int(ss.text!) ?? 0)
            //assign timestamp as value to key in boatList dictionary
            boatList[boatName.text!] = newBoatTime
            //clear fields and display current calculations
            boatName.text = ""
            hh.text = ""
            mm.text = ""
            ss.text = ""
            resultsView.text = "Fastest boat was \'\(fastestBoat().0)\' with a time of \(fastestBoat().1.stringTime)\n\n"
            resultsView.text += "Slowest boat was \'\(slowestBoat().0)\' with a time of \(slowestBoat().1.stringTime)\n\n"
            resultsView.text += "The average time of \(boatList.count) boat(s) was \(averageTime().stringTime)"
        
        }
    }
    
    
    @IBAction func clearAllData(_ sender: UIButton) {
        boatList = [ : ]
        clearFields()
    }
    
    func fastestBoat() -> (String, TimeStamp) {
        var boatName = String()
        var time = TimeStamp(hh: 999999, mm: 0, ss: 0)
        for (key, value) in boatList {
            if value.computedTime < time.computedTime {
                time = value
                boatName = key
            }
        }
        return (boatName, time)
    }
    
    func slowestBoat() -> (String, TimeStamp) {
        var boatName = String()
        //uses alt init method
        var time = TimeStamp(-1)
        for (key, value) in boatList {
            if value.computedTime > time.computedTime {
                time = value
                boatName = key
            }
        }
        return (boatName, time)
    }
    
    func averageTime() -> (TimeStamp) {
        var sum = Int()
        for (_, value) in boatList {
            sum += value.computedTime
        }
        //uses alt init method
        return TimeStamp(sum / boatList.count)
    }
    
    func clearFields() {
        boatName.text = ""
        hh.text = ""
        mm.text = ""
        ss.text = ""
        resultsView.text = "\(boatList.count) boat(s) in the system.\n\nEnter a boat name to proceed."
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        boatName.delegate = self
        hh.delegate = self
        mm.delegate = self
        ss.delegate = self
    }
}

//added this extension to allow keyboard to properly go away when return is tapped
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
