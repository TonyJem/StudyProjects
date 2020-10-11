import UIKit

class ImageEggViewController: UIViewController {
    
    var mainImage = UIImage()
    
    @IBOutlet var imageEgg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageEgg.image = mainImage
    }
}
