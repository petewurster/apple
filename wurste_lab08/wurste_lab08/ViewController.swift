import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sampleText: UITextView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let test = segue.destination as! anotherViewController
        test.rawStringData = sampleText.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

