import UIKit

class SetterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var rawData = [Clock]()
    var topClock = Clock(0)
    var bottomClock = Clock(0)
    var pickerData = [[String]]()
    var timeStampFromPicker = TimeStamp(0)

    @IBOutlet weak var topPicker: UIPickerView!
    
    @IBAction func applyChanges(_ sender: UIButton) {
        //re-instantiate new Clocks
        timeStampFromPicker = TimeStamp(
            hh: topPicker.selectedRow(inComponent: 0),
            mm: topPicker.selectedRow(inComponent: 1),
            ss: topPicker.selectedRow(inComponent: 2)
        )
        topClock = Clock(timeStampFromPicker.computedTime)
        bottomClock = Clock(timeStampFromPicker.computedTime)
    }
    
    //define picker attributes
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 60
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueBack = segue.destination as! ViewController
        segueBack.setterData = [topClock, bottomClock]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        topClock = rawData[0]
        bottomClock = rawData[1]
        self.topPicker.delegate = self
        //fill picker with values
        let times = Array(0 ... 59).map(String.init)
        pickerData = [times, times, times]
        
        //set default values to match topClock
        topPicker.selectRow(topClock.stamp.hh, inComponent: 0, animated: true)
        topPicker.selectRow(topClock.stamp.mm, inComponent: 1, animated: true)
        topPicker.selectRow(topClock.stamp.ss, inComponent: 2, animated: true)
    }




}
