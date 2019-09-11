func positiveReply(test: String) -> Bool{
    let tested: Bool
    switch test {
    case "y", "yes", "yep", "Y", "YES", "YEP", "true", "TRUE", "T":
        tested = true
    default:
        tested = false
    }
    return tested
}

func appendStory() {
    switch player.hobbyActivity {
        case "drinking", "drink":
            story.branches.append("You were out at the bar last night with some friends\(player.likesClass ? "" : " and feeling hungover today").")
        case "learn", "learning":
            story.branches.append("You spent yesterday studying\(player.likesClass ? "." : " (but not too hard!)")")
        case "play", "game", "playing", "playing games", "games":
            story.branches.append("Yesterday was full of \(player.likesClass ? "computer" : "board") games.")
        default:
            story.branches.append("Last night, you were really busy (doing whatever it is that you do).")
    }
    
    story.branches.append("Today is another \(player.likesClass ? "exciting" : "boring") lab day in CIS 200.")
    story.branches.append("You really wanna get \(player.testScore == "A" ? "another \"A\"" : "better than a\(player.testScore == "F" ? "n" : "") \"\(player.testScore)\"") on this assignment.")
    
    story.branches.append("You remember hearing that sitting closer to the front of the class can result in better grades.\nDo you wanna move seats?")
    story.branches.append("So you move closer to the front and now you can read over Pete's shoulder.\nDo you try to cheat off of Pete?")
    story.branches.append("Pete realizes that you're trying to copy his work. He says, \"\(player.userName), professor Liss will KNOW that you didn't write this code.  I'm happy to help you, but you need to do your own work!\"")
    story.branches.append("Now that you're closer to the board, you have an easier time paying attention because the fonts are readable and you can better hear the professor. This is going to be a great class\(player.likesClass ? "" : " after all")!")
    story.branches.append("You decide to keep sitting in the back where the professor can't see your monitor even when he's walking around.\nIs this so you can rip off other peoples' code from https://.stackoverflow.com?")
    story.branches.append("You decide to tune out during lab time and blog about \(player.hobbyActivity) instead. When you turn in your plagiarized assignment, Prof Liss easily spots it. You have been turned in for a violation of CCP's academic integrity policy.")
    story.branches.append("You decide to keep your seat: your network account is already configured on that machine and besides it's easier to focus when you have more personal space. After class you meet up with the professor to clarify a few things you were confused about. Professor Liss helps guide you in your studies and you get an \"A!\"")
}
