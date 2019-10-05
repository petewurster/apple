import Foundation

var aperature: Double
var shutterSpeed: Double
var iso: Double
var description: String


func getUserData() -> (Double, Double, Double, String) {
    print("\nlet\'s build another photo instance")
    print("aperature (x.x) >>", terminator: " ")
    let aperature = Double(readLine() ?? "0.0") ?? 0.0
    print("shutterSpeed (1 / x) >>", terminator: " ")
    let shutterSpeed = 1 / (Double(readLine() ?? "0.0") ?? 0.0)
    print("iso (x.x) >>", terminator: " ")
    let iso = Double(readLine() ?? "0.0") ?? 0.0
    print("description (string) >>", terminator: " ")
    let description = readLine() ?? ""
    return (aperature, shutterSpeed, iso, description)
}

var userData = getUserData()

var test = PhotoMetadata(userData.0, userData.1, userData.2, userData.3)
var classtest = PhotoMetadataClass(userData.0, userData.1, userData.2, userData.3)
var classTestCopy = classtest

userData = getUserData()

var test2 = PhotoMetadata(userData.0, userData.1, userData.2)

test.showAllMetadata("test")
test2.showAllMetadata("test2 description set to default")

test.setDescription("i am the original but my desc has been mutated")

var copy = test
var anotherCopy = PhotoMetadata(test, "second copy")
copy.setDescription("i am a copy")

copy.showAllMetadata("copy of test")
anotherCopy.showAllMetadata("test, copied again by alternate init")
test.showAllMetadata("test")
classtest.showAllMetadata("class")

classTestCopy.setDescription("mutated class description")
classtest.showAllMetadata("class")

var renamedClassTest = PhotoMetadataClass(test, "yet another")
renamedClassTest.showAllMetadata("testing class anternate init func")

print("\n\nmy class copies refer to the same instance: \(classtest === classTestCopy)")
print("the class instance created by the alternate init func does too: \(classtest === renamedClassTest)\n\n")
