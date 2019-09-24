import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var verifyUserInput: UITextField!
    @IBOutlet weak var resultMessages: UITextView!
    
    var testPassword: String = ""
    var verifyPassword: String = ""
    var errors: Set = [""]
    let commonBadPasswords = ["password", "123456", "12345678", "1234", "qwerty", "12345", "dragon", "letmein", "monkey", "abc123"]
  
    @IBAction func submitUserInput(_ sender: UIButton) {
        resultMessages.text = ""
        testPassword = userInput.text ?? ""
        verifyPassword = verifyUserInput.text ?? ""
        
        let allGood: [Bool] = [passwordsMatch(),
                               passwordLengthIsGood(),
                               stringSearchIsGood(testString: testPassword.lowercased())]
        if allGood.reduce(true, {start, next in start && next}) {
            errors = ["\"\(testPassword)\" is okay"]
        }
        displayResults()
    }
    
    
    func passwordsMatch() -> Bool {
        if testPassword != verifyPassword {
            errors.insert("-passwords no not match\n")
        }
        return testPassword == verifyPassword
    }
    
    
    func passwordLengthIsGood() -> Bool {
        if testPassword.count < 4 {
            errors.insert("-you need to add \(4 - testPassword.count) more characters\n")
        }
        return testPassword.count > 3
    }
    
    
    func stringSearchIsGood(testString: String) -> Bool {
        var goodStringTestResult = true
        for word in commonBadPasswords {
            //numeric strings from the bad password list are not allowed at beginning or end
            if let _ = Int(word) {
                if testString.hasPrefix(word) {
                    errors.insert("-cannot start password with \"\(word)\"\n")
                    goodStringTestResult = false
                }
                if testString.hasSuffix(word) {
                    errors.insert("-cannot end password with \"\(word)\"\n")
                    goodStringTestResult = false
                }
            //highlight indexes for banned alphabetic strings
            }else if testString.contains(word) {
                let wordPosition = testString.range(of: word)!
                let firstChar = testString[...wordPosition.lowerBound].count
                let lastChar = testString[..<wordPosition.upperBound].count
                errors.insert("-password may not contain \"\(word)\" (chars \(firstChar)-\(lastChar))\n")
                goodStringTestResult = false
            }
        }
        return goodStringTestResult
    }
    
    
    func displayResults() {
        for error in errors {
            resultMessages.text += error
        }
        errors = []
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userInput.delegate = self
        verifyUserInput.delegate = self
    }
}

//added this extension to allow keyboard to properly go away when return is tapped
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

