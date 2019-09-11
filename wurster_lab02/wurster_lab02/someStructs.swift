struct Person {
    let likesClass: Bool
    let userName, hobbyActivity: String
    let testScore: Character
    init(userName: String, likesClass: Bool, hobbyActivity: String, testScore: Character) {
        self.userName = userName
        self.likesClass = likesClass
        self.hobbyActivity = hobbyActivity
        self.testScore = testScore
    }
}

struct Story {
    let player: Person
    var branches: [String]
    init(player: Person, branches: [String]) {
        self.player = player
        self.branches = branches
    }
}
