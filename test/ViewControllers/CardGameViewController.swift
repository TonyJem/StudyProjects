import UIKit

class CardGameViewController: UIViewController {
    //    MARK: - Outlets
    @IBOutlet var cardButtonsTapped: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    //    MARK: - Properties
    let cardsSymbols = ["🐶","🐱","🐭","🐰","🦊","🐸","🐶","🐱","🐭","🐰","🦊","🐸" ]
    
    var lastSelectedCardIndex = -1
    
    var curentScore = 0 {
        didSet{
            setScoreLabel()
        }
    }
    
    
    //    MARK: - StartHere
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCardAppearance()
        
        setScoreLabel()
        
    }
    
    func setScoreLabel(){
        scoreLabel.text = "Score: \(curentScore)"
    }
    
    
    //    MARK: - Actions
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        curentScore = 0
    }
    
    
    @IBAction func cardTapAction(_ sender: UIButton) {
        let cardIndex = cardButtonsTapped.firstIndex(of: sender)!
        let selectedCardSymbol = cardsSymbols[cardIndex]
        
        UIView.transition(
            with: sender,
            duration: 0.3,
            options: [.transitionFlipFromRight]) {
        } completion: { _ in
        }
        
        if lastSelectedCardIndex == -1 {
            lastSelectedCardIndex = cardIndex
            sender.setTitle(selectedCardSymbol, for: .normal)
            sender.isEnabled = false
        } else if lastSelectedCardIndex != cardIndex {
            let lastCardSymbol = cardsSymbols[lastSelectedCardIndex]
            
            if lastCardSymbol == selectedCardSymbol { // Two Cards Matched OK
                sender.setTitle(selectedCardSymbol, for: .normal)
                sender.isEnabled = false
                curentScore += 3
                
            } else {
                sender.setTitle(selectedCardSymbol, for: .normal)
                sender.isEnabled = false
                
                curentScore -= 1
                if curentScore < 0 {
                    curentScore = 0
                }
                
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
