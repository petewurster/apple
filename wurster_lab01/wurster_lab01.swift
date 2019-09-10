func main() {
    print("\nenter three integers")
    let nums = [Int(Double(readLine() ?? "0") ?? 0),
                Int(Double(readLine() ?? "0") ?? 0),
                Int(Double(readLine() ?? "0") ?? 0)]
    let mean = getMean(sum: Double(nums.reduce(0, {sum, next in sum + next})), count: nums.count)
    print("The mean of \(nums) was " + String(mean) + ". \nenter another integer")
    let newNum = Int(Double(readLine() ?? "0") ?? 0)
    let newMean = getMean(sum: (mean + Double(newNum)), count: 2)
    print("The mean of " + String(mean) + " and " + String(newNum) + " was " + String(newMean) + ".\n")
}

func getMean(sum: Double, count: Int) -> Double {
    return (sum / Double(count))
}

main()