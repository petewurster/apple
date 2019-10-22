import UIKit

class anotherViewController: UIViewController {

    var rawStringData = String()
    @IBOutlet weak var analysisResults: UITextView!
    
    //builds a dictionary of character:count pairs
    func deconstructStringData(_ rawStringData: String) -> [Character : Int] {
        //uses space:0 so that for-loop doesn't fail
        var dictionaryResults: [Character : Int] = [" " : 0]
        for character in rawStringData {
            for key in dictionaryResults.keys {
                if character == key {
                    dictionaryResults[key]! += 1
                }else{
                    if dictionaryResults[character] == nil {
                        dictionaryResults[character] = 1
                    }
                }
            }
        }
        return dictionaryResults
    }
    
    //takes the dictionary and strips it into an array of tuples and
    //sorts the resulting array by frequency
    func sortResults(_ dictionaryToStrip: [Character : Int]) -> [(Int, Character)] {
        var resultsAsAnArray = [(Int, Character)]()
        for (key, value) in dictionaryToStrip {
            resultsAsAnArray += [(value, key)]
        }
        resultsAsAnArray.sort(by: >)
        return resultsAsAnArray
    }
    
    func outputResults(_ sortedArray: [(Int, Character)]) {
        analysisResults.text = "character\tcount\n\n"
        for tuple in sortedArray {
            switch tuple.1 {
            case " ":
                analysisResults.text += "space"
            case "\n":
                analysisResults.text += "newline"
            case "\t":
                analysisResults.text += "tab\t"
            default:
                analysisResults.text += "\(tuple.1)\t"
            }
            
            analysisResults.text += "\t\t\(tuple.0)\n"
        }
        
        //fix results if the only item is zero spaces
        if sortedArray.count == 1 && sortedArray[0].0 == 0 && sortedArray[0].1 == " " {
            analysisResults.text = "Go back and enter some text to be analyzed."
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //trying to improve read-ability of nested function calls
        outputResults(
            sortResults(
                deconstructStringData(rawStringData)
            )
        )
    }

}

