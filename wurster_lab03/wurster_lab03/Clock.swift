class Clock{
    let maxTime = 30
    let startMessage = "Tap to start"
    let endMessage = "You lose!"
    var isRunning = false
    var currentTime: Int
    var label: String
    
    init() {
        self.currentTime = maxTime
        self.label = startMessage
    }
    
    //reset both clocks
    static func resetClocks(_ clocks: Clock...) {
        for clock in clocks {
            clock.isRunning = false
            clock.currentTime = clock.maxTime
            clock.label = clock.startMessage
        }
    }
    
    //as long as one clock is running, decrement currentTime and update clock label
    static func updateStatus(_ clocks: Clock...) {
        for clock in clocks {
            if clock.isRunning {
                clock.currentTime -= 1
                clock.label = String(clock.currentTime)
                if clock.currentTime < 0 {
                    clock.label = clock.endMessage
                    clock.isRunning.toggle()
                }
            }
        }
    }
    
    //toggle clocks when tapped
    func switchClocks(_ otherClock: Clock) {
        if self.isRunning {
            self.isRunning.toggle()
            otherClock.isRunning.toggle()
        }else if !self.isRunning && !otherClock.isRunning {
            self.isRunning.toggle()
            self.label = String(self.currentTime)
            otherClock.label = String(otherClock.currentTime)
        }
    }
    
    
    
    
    
}
