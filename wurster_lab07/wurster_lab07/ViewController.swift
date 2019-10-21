import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var largeView: UIImageView!
    @IBOutlet weak var imageCaption: UILabel!
    @IBOutlet weak var currentView: UIButton!
    @IBOutlet weak var prevView: UIButton!
    @IBOutlet weak var nextView: UIButton!
    
    //this array used to track which image is the current focus
    let photoList: [String] = ["mush01", "mush02", "mush03", "mush04", "mush05", "mush06", "mush07", "mush08", "mush09", "mush10"]
    let photoDescriptions = [
        "mush01" : "A sole mushroom sprouts up among tundra plants that include Dwarf Birch, Lupine, and Avens. Accessibility statement: One brown mushroom surrounded by bright green leaves from tundra plants. Sisiak Climate Station Installation",
        "mush02" : "The white gills of a toppled mushroom stand out against the green moss of the tundra. Presence or lack of gills is one good way to start to identify a mushroom. Close view of toppled mushroom.",
        "mush03" : "Cortinarius is a large and highly diverse genus. They can be recognized by a cob-webby veil (or Cortina) which covers the developing gills, of which remnants often remain in mature individuals.",
        "mush04" : "Mushrooms sprout among summer plants which include Coltsfoot, blueberry (see the unripe green berries?), crowberry, horsetail, moss, and lichens. 3 white mushrooms sourounded by green summer plants.",
        "mush05" : "Winter Chanterelle (Craterellus tubaeformis) - The winter chanterelle, pictured in the photo, is one of the most common edible mushrooms found in the park and often grows in clusters, most often on mossy areas and rotting wood. The mushrooms are small, thin, and trumpet-shaped with a brownish cap, hollow, and waxy-looking stalk. Golden Chanterelle (Cantharellus formosus or Cantharellus cascadensis) - Another, less common, edible mushroom in the park (not pictured) is the golden chanterelle. These are larger, fleshier mushrooms compared with the winter chanterelles, and more golden in color.",
        "mush06" : "Mushrooms of the genus Lactarius share similar features with the Russula, in particular the brittle stems. They can, however, be distinguished from Russula by the milky or watery substance they exude when broken, especially around the gills and the stem attachment to the cap.",
        "mush07" : "Hedgehog Mushrooms (Hydnum repandum) are a distinctive and relatively common edible species found in the park. They have a smooth cap, which is usually pale cream to pale orange in color and irregularly shaped. Small, fragile, cream-colored spines hang from the underside of the cap. The stalk is usually stout and firm, and its flesh is usually dense and soft.",
        "mush08" : "Mushrooms and other fungi sprout from decaying wood, assisting the decomposition process. The Ohanapecosh River canyon's old-growth forest is an amazingly rich ecosystem, home to an incredible variety of plants and wildlife.",
        "mush09" : "Mushrooms of this genus can be recognized by their often brightly colored caps, squat stature, white stems and brittle flesh. The stems should easily and break rather cleanly, like chalk. While some species in the genus are edible, many are poisonous. Consumption is not recommended.",
        "mush10" : "This polypore can be found growing in abundance on trees in the park. It is hard and woody to touch, and grows in shelf-like formations with a brown to reddish upper surface and white bottom edge."
    ]
    
    
    @IBAction func currentTapped(_ sender: UIButton) {
        switchImageAndCaption()
    }
    
    @IBAction func prevTapped(_ sender: UIButton) {
        var photoIndex = Int()
        for (key, val) in photoDescriptions {
            if val == imageCaption.text {
                photoIndex = photoList.firstIndex(of: key)! - 1
            }
        }
        //wrap-around to end of array if index is negative
        setImagesAndCaption(photoIndex == -1 ? photoList.count - 1 : photoIndex)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        var photoIndex = Int()
        for (key, val) in photoDescriptions {
            if val == imageCaption.text {
                photoIndex = photoList.firstIndex(of: key)! + 1
            }
        }
        //wrap-around to start of array if index exceeds array length
        setImagesAndCaption(photoIndex == photoList.count ? 0 : photoIndex)
    }
    
    func switchImageAndCaption() {
        largeView.isHidden.toggle()
        imageCaption.isHidden.toggle()
    }
    
    func setImagesAndCaption(_ photoIndex: Int) {
        currentView.setBackgroundImage(UIImage(named: photoList[photoIndex]), for: .normal)
        largeView.image = UIImage(named: photoList[photoIndex])
        imageCaption.text = photoDescriptions[photoList[photoIndex]]
        //ternaries set image values for prev and next buttons; wrap-around as appropriate
        prevView.setBackgroundImage(UIImage(named:
            photoList[(photoIndex == 0 ? photoList.count - 1 : photoIndex - 1)]),
                                    for: .normal)
        nextView.setBackgroundImage(UIImage(named:
            photoList[(photoIndex == photoList.count - 1 ? 0 : photoIndex + 1)]),
                                    for: .normal)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImagesAndCaption(0)
        
    }


}


