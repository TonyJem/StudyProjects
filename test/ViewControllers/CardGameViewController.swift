import UIKit

class CardGameViewController: UIViewController {

    
    @IBOutlet var cardButtonsTapped: [UIButton]!
    
    let cardsSymbols = ["🐶","🐱","🐭","🐰","🦊","🐸","🐶","🐱","🐭","🐰","🦊","🐸" ]
    
    var lastSelectedCardIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCardAppearance()
    }


//    MARK: - Actions
    
    @IBAction func cardTapAction(_ sender: UIButton) {
        let cardIndex = cardButtonsTapped.firstIndex(of: sender)!
        let selectedCardSymbol = cardsSymbols[cardIndex]
        sender.setTitle(selectedCardSymbol, for: .normal)
    }
    
    
    //    MARK: - Setup
    
    func setupCardAppearance(){
        for button in cardButtonsTapped {
            button.layer.cornerRadius = 8
        }
    }
   
    
}
