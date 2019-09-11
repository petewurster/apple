print("What is your name?", terminator: " ")
let name = readLine() ?? "Nobody"

print("Hello \(name), do you enjoy CIS 200?", terminator: " ")
var yesNo = positiveReply(test: readLine() ?? "")

print("\(yesNo ? "Glad to hear it!" : "That's too bad...") What did you score on your last assignment, \(name)?", terminator: " ")
let test = Int(Double(readLine() ?? "0") ?? 0)

let testLetter: Character
switch abs(test) {
    case 0 ... 59:
        testLetter = "F"
    case 60 ... 69:
        testLetter = "D"
    case 70 ... 79:
        testLetter = "C"
    case 80 ... 89:
        testLetter = "B"
    default:
        testLetter = "A"
}

print("Which is more fun?\n(drinking, learning, playing games):", terminator: " ")
var hobby = readLine() ?? ""

var branches: [String] = []
let player = Person(userName: name, likesClass: yesNo, hobbyActivity: hobby, testScore: testLetter)
var story = Story(player: player, branches: branches)

appendStory()
for branch in story.branches[0 ... 3] {
    print(branch, terminator: " ")
}

yesNo = positiveReply(test: readLine() ?? "")
if yesNo == true {
    print(story.branches[4], terminator: " ")
    
    yesNo = positiveReply(test: readLine() ?? "")
    if yesNo == true {
        print(story.branches[5], terminator: " ")
    }else{
        print(story.branches[6], terminator: " ")
    }
}else{
    print(story.branches[7], terminator: " ")
    
    yesNo = positiveReply(test: readLine() ?? "")
    if yesNo == true {
        print(story.branches[8], terminator: " ")
    }else{
        print(story.branches[9], terminator: " ")
    }
}
