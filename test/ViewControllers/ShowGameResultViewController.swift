import UIKit

class ShowGameResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    var gameResult = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultLabel.text = String(gameResult)
        
    }
    

    
    
    

}
