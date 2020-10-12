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
        
        
        
        if lastSelectedCardIndex == -1 {
            lastSelectedCardIndex = cardIndex
            sender.setTitle(selectedCardSymbol, for: .normal)
            sender.isEnabled = false
        } else if lastSelectedCardIndex != cardIndex {
            let lastCardSymbol = cardsSymbols[lastSelectedCardIndex]
            
            if lastCardSymbol == selectedCardSymbol {
                sender.setTitle(selectedCardSymbol, for: .normal)
                sender.isEnabled = false
            } else {
                sender.setTitle(selectedCardSymbol, for: .normal)
                sender.isEnabled = false
                
                let lastCardIndex = lastSelectedCardIndex
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    sender.setTitle("", for: .normal)
                    sender.isEnabled = true
                    
                    let lastCardButton = self.cardButtonsTapped[lastCardIndex]
                    lastCardButton.setTitle("", for: .normal)
                    lastCardButton.isEnabled = true
                }
            }
            lastSelectedCardIndex = -1
        }
    }
    
    
    //    MARK: - Setup
    
    func setupCardAppearance(){
        for button in cardButtonsTapped {
            button.layer.cornerRadius = 8
        }
    }
    
    
}
