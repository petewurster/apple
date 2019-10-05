import Foundation

struct PhotoMetadata {
    
    let aperture: Double
    let shutterSpeed: Double
    let iso: Double
    let ev: Double
    var description: String = ""
    var lux: Double {
        get {
            return 2.5  * pow(2.0, self.ev)
        }
    }
    
    init(_ aperture: Double, _ shutterSpeed: Double, _ iso: Double, _ tag: String = "no description") {
        self.aperture = aperture
        self.shutterSpeed = shutterSpeed
        self.iso = iso
        self.ev = log2(self.aperture * self.aperture / self.shutterSpeed) + log2(self.iso / 100.0)
        setDescription(tag)
    }
    
    init(_ copiedInstance: PhotoMetadata, _ tag: String = "") {
        self.aperture = copiedInstance.aperture
        self.shutterSpeed = copiedInstance.shutterSpeed
        self.iso = copiedInstance.iso
        self.ev = copiedInstance.ev
        setDescription(tag)
    }
    
    mutating func setDescription(_ tag: String) {
        self.description = tag.uppercased()
    }
    
    func showAllMetadata(_ label: String) {
        print("\n----------\(label)------------")
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            print("\(child.label ?? ""): \(child.value)")
        }
        print("lux: \(self.lux)")
    }
    
}
