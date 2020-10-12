import UIKit

class ShowGameResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    let minimalScore = 5
    var gameResult = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLabelText()
        
    }
    
    func gameIsWon() -> Bool{
        if gameResult >= minimalScore {
            return true
        } else {
            return false
        }
    }

    func setLabelText(){
        
        if gameIsWon() {
            resultLabel.text = "Congratulations!!! Game is WON with result \(String(gameResult))"
        } else {
            resultLabel.text = "Ohh!!! Game is Losed. Minimal score is: \(minimalScore) and your result is only: \(String(gameResult))"
        }
    }
}
